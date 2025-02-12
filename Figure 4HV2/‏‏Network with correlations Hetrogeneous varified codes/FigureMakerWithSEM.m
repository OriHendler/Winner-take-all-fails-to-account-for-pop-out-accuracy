% This code will produce figure 2 panel H
clear all
close all

% Load data for plot
load('data_saver_mean_and_SEM')
skip_size = 6;
order = [1 + 2 * skip_size : 3 * skip_size, 1 + skip_size : 2 * skip_size, 1 : skip_size ...
    , 1 + 5 * skip_size : 6 * skip_size, 1 + 4 * skip_size : 5 * skip_size, 1 + 3 * skip_size : 4 * skip_size ...
    , 1 + 8 * skip_size : 9 * skip_size, 1 + 7 * skip_size : 8 * skip_size, 1 + 6 * skip_size : 7 * skip_size];
color_order = [0 0 1; 0 0 0.7; 0 0 0.5; 1 0 0; 0.7 0 0; 0.5 0 0; 0 1 0; 0 0.7 0; 0 0.5 0];
figure(1)
for idx = 1:9
    % Get SEM values for the current group
    sem = data_saver_mean_and_SEM(order((idx - 1) * skip_size + 1:skip_size * idx), end);
    
    % Debugging: Check SEM values
    disp(['SEM values for group ', num2str(idx), ':']);
    disp(sem);
    
    % Calculate marker size proportional to SEM
    marker_size = 100 * sem+1; % Adjust the scaling factor (100) as needed

    % Plot data with marker size proportional to SEM
    for i = 1:numel(marker_size)
        plot(data_saver_mean_and_SEM(1:skip_size, 1), ...
             data_saver_mean_and_SEM(order((idx - 1) * skip_size + i), 5), ...
             'o', 'color', color_order(idx, :), 'MarkerSize', marker_size(i));
        hold on
    end
end

% Compute estimation of readout accuracy according to analytical expression
Mar = 1:100;
mu = 12.8 * 0.2;
qar = [1.3 1.2 1.1];
Nar = [10000 100 20];

for Nind = 1:length(Nar)
    N = Nar(Nind);
    sigma = sqrt(mu / (N));
    for Mind = 1:length(Mar)
        for qind = 1:length(qar)
            correct_readout = 0; % Initialise for next loop
            M = Mar(Mind) + 1;
            q = qar(qind);
            am = (sqrt(2 * log(M))) / sigma;
            bm = mu / q + (sqrt(2 * log(M)) - 0.5 * (log(log(M)) + log(4 * pi))) / sqrt(2 * log(M)) * sigma;
            p = @(x, m, s) exp(-((x - m) .^ 2) / (2 * s .^ 2)) / (s * sqrt(2 * pi));
            c = integral(@(x) p(x, mu, sigma * sqrt(q)), bm, inf);
            c_saver(Mind) = c;

            % Analytical solution with Gambel approximation but without window approximation
            xvec = -20:0.01:20;
            Gussian = normpdf(xvec, mu, sigma * sqrt(q));
            GambelCdf = exp(-exp(-(xvec - bm) * am));
            Argoment = Gussian .* GambelCdf;
            P_c_function = trapz(xvec, Argoment);
            P_c_saver{Nind}(qind, Mind) = P_c_function;
        end
    end
end

% Plot analytical solutions
for idx = 1:3
    for idx_for_q = 1:3
        plot(1:100, P_c_saver{1, idx}(idx_for_q, :), 'color', color_order((idx - 1) * 3 + idx_for_q, :))
        hold on
    end
end

hold off
xlim([0 100]);
ylim([0 1]);
xticks(0:50:100);
yticks(0:0.5:1);
ylabel('Readout Accuracy')
xlabel('Number of Distractors')
box off

% saveas(figure(1),'FIGURE4PannelG','jpg');
% saveas(figure(1),'FIGURE4PannelG','fig');
% saveas(figure(1),'FIGURE4PannelG','tif');
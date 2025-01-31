% This code will produce figure 2 panel H
clear all
close all

GrphicSettings 

% Load data for plot
load('C:\Users\hendlero\OneDrive\שולחן העבודה\מאמר ראשון מוכן לשליחה\PLOS computational Biology\Peer review A\Figure 4HV2 edited for 2I2AFC\‏‏Network with correlations Hetrogeneous varified codes\data_analysis\Special GWTA\2\POPM10~1.MAT');

data_saver_mean_and_SEM(:,1)= mean_correct_readout_saver_all_realizations_matrix(:,3);
data_saver_mean_and_SEM(:,2)= mean_correct_readout_saver_all_realizations_matrix(:,4);
data_saver_mean_and_SEM(:,3)= mean_correct_readout_saver_all_realizations_matrix(:,5);
data_saver_mean_and_SEM(:,4)= mean_correct_readout_saver_all_realizations_matrix(:,6);
data_saver_mean_and_SEM(:,5)= mean_correct_readout_saver_all_realizations_matrix(:,2);
% Number of realizations
n_realizations = size(correct_readout_saver_all_realizations_matrix, 3);

% Standard deviation across the third dimension for the second column
std_vals = std(correct_readout_saver_all_realizations_matrix(:,2,:), 0, 3);

% Compute the standard error of the mean
data_saver_mean_and_SEM(:,6) = std_vals / sqrt(n_realizations);

%% Data preparation
skip_size = 3; % Set as number of different q saved in dataset
number_of_skips = 999; % Set as number of different N saved in dataset, minus 1
number_of_blocks = 3; % Set as number of different correlations saved in dataset
block_size = 3000; % Set as number of values per c
number_of_rounds = 3;

for block = 1:number_of_blocks
    for round = 1:number_of_rounds
        % Define start and end indices based on block and round
        start_idx = round + (block - 1) * block_size;
        end_idx = start_idx + skip_size * (number_of_skips);
        % Extract values from column 2 with skipping
        extracted_values_N_Pop = data_saver_mean_and_SEM(start_idx:skip_size:end_idx, 2);
        % Extract values from column 5 with skipping
        extracted_values_Pc_Pop = data_saver_mean_and_SEM(start_idx:skip_size:end_idx, 5);
        % Extract values from column 6 with skipping
        extracted_values_Pc_SEM_Pop = data_saver_mean_and_SEM(start_idx:skip_size:end_idx, 6);

        % Assign to order_N_axis
        order_N_axis(number_of_rounds * (block - 1) + round, :) = extracted_values_N_Pop;
        % Assign to order_Pc_axis
        order_Pc_axis(number_of_rounds * (block - 1) + round, :) = extracted_values_Pc_Pop;
        % Assign to order_Pc_SEM_axis
        order_Pc_SEM_axis(number_of_rounds * (block - 1) + round, :) = extracted_values_Pc_SEM_Pop;
    end
end

%% Plot scatter data with error bars
color_order = [0 0 0.5; 0 0 0.7; 0 0 1; 0.5 0 0; 0.7 0 0; 1 0 0; 0 0.5 0; 0 0.7 0; 0 1 0];

figure(1); hold on;
for idx = 1:9
    % Extract required values
    x_vals = order_N_axis(idx, [1 10:20:990 1000]);
    y_vals = order_Pc_axis(idx, [1 10:20:990 1000]);
    error_vals = order_Pc_SEM_axis(idx, [1 10:20:990 1000]);

    % Plot scatter with error bars
    errorbar(x_vals, y_vals, error_vals, 'o', ...
        'MarkerFaceColor', 'none', ...
        'LineWidth', 1.5, ...
        'Color', color_order(idx,:));
end

% Keep the reference line in black unchanged
% plot([1 1000], [0.5 0.5], 'k');

hold off;
xlim([0 1000]);
ylim([0 1]);
xticks(0:500:1000);
yticks(0:0.5:1);
ylabel('Readout Accuracy');
xlabel('Neurons per Population');
box off;

%% Save the figure in multiple formats
saveas(figure(1), 'FIGURE5PannelA_withErrorBars', 'jpg');
saveas(figure(1), 'FIGURE5PannelA_withErrorBars', 'fig');
saveas(figure(1), 'FIGURE5PannelA_withErrorBars', 'tif');
saveas(figure(1), 'FIGURE5PannelA_withErrorBars.pdf');
exportgraphics(figure(1), 'FIGURE5PannelA_withErrorBars.pdf', 'ContentType', 'vector', 'Resolution', 600);

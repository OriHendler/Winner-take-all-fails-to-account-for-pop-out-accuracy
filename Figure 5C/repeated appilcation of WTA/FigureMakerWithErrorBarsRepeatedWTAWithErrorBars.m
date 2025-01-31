%% Data Preparation
clear all
close all

% Load data for plot
load('C:\Users\hendlero\OneDrive\שולחן העבודה\מאמר ראשון מוכן לשליחה\PLOS computational Biology\Peer review A\repeated appilcation of WTA\data_analysis\set 3\data_analysisWTArepeatedM38N10001000-date-25_01_23_15_13_15ExpQMeanRange.mat')

data_saver_mean_and_SEM(:,1) = mean_correct_readout_saver_all_realizations_matrix(:,3);
data_saver_mean_and_SEM(:,2) = mean_correct_readout_saver_all_realizations_matrix(:,4);
data_saver_mean_and_SEM(:,3) = mean_correct_readout_saver_all_realizations_matrix(:,5);
data_saver_mean_and_SEM(:,4) = mean_correct_readout_saver_all_realizations_matrix(:,6);
data_saver_mean_and_SEM(:,5) = mean_correct_readout_saver_all_realizations_matrix(:,1);

% Number of realizations
n_realizations = size(correct_readout_saver_all_realizations_matrix, 3);

% Standard deviation across the third dimension for the first column
std_vals = std(correct_readout_saver_all_realizations_matrix(:,1,:), 0, 3);

% Compute the standard error of the mean
data_saver_mean_and_SEM(:,6) = std_vals / sqrt(n_realizations);

% Extract unique q values
unique_q = unique(data_saver_mean_and_SEM(:, 3));

% Filter for M=8 only
data_filtered = data_saver_mean_and_SEM(data_saver_mean_and_SEM(:, 1) == 8, :);

% Define the selected indices
selected_repetitions = [1, 3, 5, 7, 10];

% Define the correct chance-level values
chance_levels = [0.1111, 0.0343, 0.0115, 0.00404, 0.000265];

%% Plotting
figure;
hold on;

% Define color scheme for q
color_map = [0 0 1; 0 0 0.7; 0 0 0.5]; % Colors for q = 1.3, 1.2, 1.1

% Initialize legend entries
errorbar_handles = [];
legend_entries = flip({'q=1.1', 'q=1.2', 'q=1.3'}); % Ensure q=1.3 is first

% Plot scatter points with error bars for each q in descending order
for j = numel(unique_q):-1:1
    % Filter rows matching the current q and selected repetitions
    idx = (data_filtered(:, 3) == unique_q(j)) & ismember(data_filtered(:, 4), selected_repetitions);
    if any(idx)
        % Extract x (repetitions), y (readout accuracy), and error (SEM)
        x_vals = data_filtered(idx, 4);
        y_vals = data_filtered(idx, 5);
        error_vals = data_filtered(idx, 6);

        % Plot error bars with scatter points
        h = errorbar(x_vals, y_vals, error_vals, 'o', ...
            'MarkerFaceColor', 'none', 'LineWidth', 1.5, ...
            'Color', color_map(j, :));

        % Store handle for legend
        errorbar_handles = [errorbar_handles; h];
    end
end

% Plot the correct chance-level accuracy as a black line
% scatter(selected_repetitions, chance_levels, 15, 'MarkerFaceColor', 'none', 'LineWidth', 1.5, 'MarkerEdgeColor', 'k');

% Add legend and labels
legend(errorbar_handles, legend_entries, 'Location', 'northwest');
xlabel('Repetitions');
ylabel('Readout Accuracy');
xticks([1 5 10]);
yticks([0, 0.5, 1]);
ax = gca;
ax.XAxis.TickDirection = 'out';
ax.YAxis.TickDirection = 'out';

% Adjust limits
xlim([1, 10]);
ylim([0, 1]);

%% Save the figure (optional)
saveas(gcf, 'ReadoutAccuracy_vs_Repetition_M8_withErrorBars', 'jpg');
saveas(gcf, 'ReadoutAccuracy_vs_Repetition_M8_withErrorBars', 'fig');
exportgraphics(gcf, 'ReadoutAccuracy_vs_Repetition_M8_withErrorBars.pdf', 'ContentType', 'vector', 'Resolution', 600);

clear all
close all
GrphicSettings

% Define matrix size
matrix_size = 9000;
cube_size = 1000;

% Initialize correlation matrix
corr_matrix = ones(matrix_size) * 0.1;

% Set diagonal values
diag_color = [0, 1, 0]; % 
corr_matrix(1:matrix_size+1:end) = 0.3;

% Set cube diagonal values
cube_diag_color = [0, 0, 1]; % 
for i = 1:cube_size:matrix_size
    corr_matrix(i:min(i+cube_size-1, matrix_size), i:min(i+cube_size-1, matrix_size)) = 0.2;
end

% Set rest of the elements
rest_color = [0, 0.5, 0]; % 
for i = 1:cube_size:matrix_size
    for j = 1:cube_size:matrix_size
        if i ~= j
            corr_matrix(i:min(i+cube_size-1, matrix_size), j:min(j+cube_size-1, matrix_size)) = 0.4; % Set your desired value here
        end
    end
end

% Display the correlation matrix using imagesc
figure;
imagesc(corr_matrix);

% Customize colormap
cmap = [diag_color; cube_diag_color; rest_color];
colormap(cmap);

% Remove title
title([]);

% Remove color bar
colorbar('off');

% Remove axes, ticks, and box
axis off;
set(gca, 'xtick', [], 'ytick', []);
box off;

% Add red grid
grid on;
set(gca, 'GridColor', 'k');

% Enhance visibility of diagonal
hold on;
for i = 1:matrix_size
    plot([i-0.5, i+0.5], [i-0.5, i+0.5], 'k-', 'LineWidth', 2); % Black diagonal line
end



% Add green squares around the rest of the population squares
for i = 1:cube_size:matrix_size
    for j = 1:cube_size:matrix_size
        if i ~= j
            rectangle('Position',[j-0.5, i-0.5, cube_size, cube_size],'EdgeColor',[1 1 1],'LineWidth',0.5);
        end
    end
end

% Add red squares around cube diagonal squares
for i = 1:cube_size:matrix_size
    rectangle('Position',[i-0.5, i-0.5, cube_size, cube_size],'EdgeColor',[1 1 1],'LineWidth',0.5);
end

% Save the figure as jpg, tif, and fig
saveas(gcf, 'HeatMapOfCorrMatrix.jpg');
saveas(gcf, 'HeatMapOfCorrMatrix.tif');
saveas(gcf, 'HeatMapOfCorrMatrix.fig');

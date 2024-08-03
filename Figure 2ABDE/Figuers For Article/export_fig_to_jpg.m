function export_fig_to_jpg(fig_handle, filename)
    % Check if figure handle is provided
    if nargin < 1 || isempty(fig_handle)
        fig_handle = gcf; % Use current figure if not provided
    end

    % Check if filename is provided
    if nargin < 2 || isempty(filename)
        error('Please provide a filename for the exported JPG file.');
    end

    % Set resolution for export (dpi)
    dpi = 300;

    % Set up temporary file name
    temp_file = ['temp_', filename];

    % Export figure to temporary PNG file
    print(fig_handle, temp_file, '-dpng', ['-r',num2str(dpi)]);

    % Read temporary PNG file
    img = imread(temp_file);

    % Save image as JPG with maximum quality
    imwrite(img, filename, 'jpg', 'Quality', 100);

    % Delete temporary PNG file
    delete(temp_file);
end

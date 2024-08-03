function GrphicSettings 
    set(groot,'DefaultaxesFontSize', 24);  % Axes
    set(groot,'DefaultaxesLabelFontSize', 0.8);  % Words ratio to the numbers in axes
    set(groot,'DefaultAxesTitleFontSizeMultiplier', 0.8);

    set(groot,'DefaultaxesFontWeight', 'bold');
    set(groot,'FixedWidthFontName', 'Helvetica');
    set(groot,'defaultLineLineWidth', 2);
    set(groot,'DefaultaxesLineWidth', 1.5);

    set(groot, 'defaultAxesTickDir', 'out');
    set(groot, 'defaultAxesTickDirMode', 'manual');
    set(groot, 'defaultLegendBox', 'off');

    set(groot, 'defaultFigureUnits', 'pixels', 'defaultFigurePosition', [50 50 600 600]);
end
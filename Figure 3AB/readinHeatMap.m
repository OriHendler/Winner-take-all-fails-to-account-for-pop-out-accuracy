clear all
close all
%
load("ConfusionMatrix20realizationsM8N100.mat")
Matrix_largest_meanFP= ConfusionMatrix{1,8};


figure(8)
s=heatmap(Matrix_largest_meanFP,'CellLabelColor','none','Colormap',turbo);

s.FontName = 'Helvetica'
% s.FontWeight = 'bold'
set(0, 'DefaultAxesFontName', 'Helvetica');
set(groot,'defaultLineLineWidth',2) 
set(0,'DefaultaxesLineWidth', 1.5)
set(0,'DefaultaxesFontSize', 16) 
set(0,'DefaultaxesFontWeight', 'bold') 
set(0,'DefaultTextFontSize', 16) 
set(0,'DefaultaxesFontName', 'Helvetica') 
set(0,'DefaultlegendFontName', 'Helvetica')

% annotation('textarrow',[0.97,0.97],[0.53,0.53],'string','Readout Accuracy','HeadStyle','none','LineStyle','none','HorizontalAlignment','center','TextRotation',90, 'fontweight', 'bold');
hAx=s.NodeChildren(3);          % return the heatmap underlying axes handle
hAx.FontWeight='bold';
hCB=s.NodeChildren(2);          % the wanted colorbar handle
hCB.FontWeight='bold';
s.GridVisible = 'off'
% title('100 Neurons per Population (N)','FontSize',15.4,'Fontname','Helvetica','FontWeight', 'bold')
title('')
% xlabel('Target Location')
% ylabel('Estimated Location')

s.ColorbarVisible= 'off'
s.ColorLimits=[0,0.5]
s.FontSize = 28
% box off
% legend('boxoff')
% legend('Location','best')
% set(gca,'TickDir','out'); % The only other option is 'in'
% pbaspect([1 1 1])
x0=10;
y0=10;
width=650;
height=650;
set(gcf,'position',[x0,y0,width,height])


saveas(figure(8),['MchangingNchangingMeann13var4mu_for_expTwelveOverTenManyRealizations50','.jpg'],'jpg');
saveas(figure(8),['MchangingNchangingMeann13var4mu_for_expTwelveOverTenManyRealizations50','.fig'],'fig');
saveas(figure(8),['MchangingNchangingMeann13var4mu_for_expTwelveOverTenManyRealizations50','.tif'],'tif');
% saveas(h,['C:\Users\Ori Hendler\Desktop\עבודה\מעוז\סיכום\Entire Code Generation 10.22\confusion_matrix_plots\',baseFileName,'.jpg'],'jpg')



%

for n=18
    Matrix_smalest_meanFP= ConfusionMatrix{1,n};

figure(n)
s=heatmap(Matrix_smalest_meanFP,'CellLabelColor','none','Colormap',turbo);

s.FontName = 'Helvetica'
% s.FontWeight = 'bold'
set(0, 'DefaultAxesFontName', 'Helvetica');
set(groot,'defaultLineLineWidth',2) 
set(0,'DefaultaxesLineWidth', 1.5)
set(0,'DefaultaxesFontSize', 16) 
set(0,'DefaultaxesFontWeight', 'bold') 
set(0,'DefaultTextFontSize', 16) 
set(0,'DefaultaxesFontName', 'Helvetica') 
set(0,'DefaultlegendFontName', 'Helvetica')

% annotation('textarrow',[0.97,0.97],[0.53,0.53],'string','Readout Accuracy','HeadStyle','none','LineStyle','none','HorizontalAlignment','center','TextRotation',90, 'fontweight', 'bold');
hAx=s.NodeChildren(3);          % return the heatmap underlying axes handle
hAx.FontWeight='bold';
hCB=s.NodeChildren(2);          % the wanted colorbar handle


 hCB.Ticks = linspace(0, 0.5, 2) ; %Create 8 ticks from zero to 1
%  hCB.TickLabels = num2cell(1:8) ;    %Replace the labels of these 8 ticks with the numbers 1 to 8

hCB.FontWeight='bold';
s.GridVisible = 'off'
% title('100 Neurons per Population (N)','FontSize',15.4,'Fontname','Helvetica','FontWeight', 'bold')
title('')
% xlabel('Target Location')
% ylabel('Estimated Location')
s.FontSize = 28

s.ColorLimits=[0,0.5]
% box off
% legend('boxoff')
% legend('Location','best')
% set(gca,'TickDir','out'); % The only other option is 'in'
% pbaspect([1 1 1])
x0=10;
y0=10;
width=650;
height=650;
set(gcf,'position',[x0,y0,width,height])

%

saveas(figure(n),['MchangingNchangingMeann13var4mu_for_expTwelveOverTenManyRealizations50MinMeanFP','.jpg'],'jpg');
saveas(figure(n),['MchangingNchangingMeann13var4mu_for_expTwelveOverTenManyRealizations50MinMeanFP','.fig'],'fig');
saveas(figure(n),['MchangingNchangingMeann13var4mu_for_expTwelveOverTenManyRealizations50MinMeanFP','.tif'],'tif');
end


% % saveas(h,['C:\Users\Ori Hendler\Desktop\עבודה\מעוז\סיכום\Entire Code Generation 10.22\confusion_matrix_plots\',baseFileName,'.jpg'],'jpg')
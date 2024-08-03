%
M= [2 4 8 16 24]
error= [1.787234043 1.446808511 1.106382979 3.063829787 1.957446809]

 %%
set(0, 'DefaultAxesFontName', 'Helvetica');
set(groot,'defaultLineLineWidth',2) 
set(0,'DefaultaxesLineWidth', 1.5)
set(0,'DefaultaxesFontWeight', 'bold') 
set(0,'DefaultaxesFontName', 'Helvetica') 
set(0,'DefaultlegendFontName', 'Helvetica')

%

figure(41)
plot(M,1-error./100,'o','MarkerSize',8,'MarkerEdgeColor','red','MarkerFaceColor',[1 0 0],'color',[0,0,1],'LineWidth',2,'LineStyle', 'none' )
hold on
plot([0 24],[0.9813 0.9813],'--',LineWidth=1.5,Color=[1 0 0])

%%
set(gca,'FontSize',32)
set(gca, 'TickDir', 'out')
xlabel('Number of Distractors','FontSize',30)
ylabel('Accuracy','FontSize',30)
title('')

% subtitle('15 Distractors, 100 Neurons per Population',FontSize=18,FontWeight='bold')
box off
ylim([0.9 1])
xlim([0 24])
xticks([0:10:20])
yticks([0.9:0.05:1])

x0=10;
y0=10;
width=650;
height=650;
set(gcf,'position',[x0,y0,width,height])

saveas(figure(41),'ExperimentalReadoutAccuracy.jpg','jpg');
saveas(figure(41),'ExperimentalReadoutAccuracy.fig','fig');
saveas(figure(41),'ExperimentalReadoutAccuracy.tif','tif');

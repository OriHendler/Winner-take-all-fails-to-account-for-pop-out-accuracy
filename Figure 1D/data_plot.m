%This code is used to plot the data coming out of data_analysis.m


clear all
close all

SerialSearch=load("Serial Search data set.csv")
ParralelSearch=load("actual Parralel Search data set.csv")

P_cVSN_plot=1;

if P_cVSN_plot
    %%
set(0, 'DefaultAxesFontName', 'Helvetica');
set(groot,'defaultLineLineWidth',2) 
set(0,'DefaultaxesLineWidth', 1.5)
set(0,'DefaultaxesFontSize', 24) 
set(0,'DefaultaxesFontWeight', 'bold') 
set(0,'DefaultTextFontSize', 24) 
set(0,'DefaultaxesFontName', 'Helvetica') 
set(0,'DefaultlegendFontName', 'Helvetica')

%

figure(41)
plot(SerialSearch(:,1),SerialSearch(:,2)./1000,'color',[0,0,1],LineWidth=3)
hold on
plot(ParralelSearch(:,1),ParralelSearch(:,2)./1000,'color',[1,0,0],LineWidth=3)
% plot(mean_correct_readout_saver_all_realizations_matrix(1:4:205,2),mean_correct_readout_saver_all_realizations_matrix(1:4:205,1),'color',[0,0,0.5],LineWidth=1.5)
%%
set(gca,'FontSize',32)
set(gca, 'TickDir', 'out')
xlabel('Number of Distractors (M)','FontSize',30)
ylabel('Reaction Time (sec)','FontSize',30)
title('')
% subtitle('15 Distractors, 100 Neurons per Population',FontSize=18,FontWeight='bold')
box off
legend('Serial Search','Parallel Search',Location='northwest');
legend boxoff  
xlim([0 30]);
ylim([0 1.35])
xticks([0:15:30])
yticks([0:0.6:1.2])

x0=10;
y0=10;
width=650;
height=650;
set(gcf,'position',[x0,y0,width,height])

saveas(figure(41),'M9Nchangingmeann13var4mu_for_expChanging.jpg','jpg');
saveas(figure(41),'M9Nchangingmeann13var4mu_for_expChanging.fig','fig');
saveas(figure(41),'M9Nchangingmeann13var4mu_for_expChanging.tif','tif');


hold off

end



%This code will produce figure 2 pannels A,B,D,E
clear all
close all

GrphicSettings 

%Load data for plot
load('WORKSPACEExactDataForPlotABDE.mat')


GrphicSettingsTHINERLINE

figure(5)
load("SEM_expD.mat")
patch([xdata_PannelD{2,1} fliplr(xdata_PannelD{2,1})], [ydata_PannelD{2,1}-SEM_expD  fliplr(ydata_PannelD{2,1}+SEM_expD)], [1 0 0],'EdgeColor', [1,0,0])
hold on
plot(xdata_PannelD{2,1},ydata_PannelD{2,1},'color',[0.7,0,0])
hold on
load("SEM_poissD.mat")
patch([xdata_PannelD{3,1} fliplr(xdata_PannelD{3,1})], [ydata_PannelD{3,1}-SEM_poissD  fliplr(ydata_PannelD{3,1}+SEM_poissD)], [0 0 1],'EdgeColor', [0,0,1])
plot(xdata_PannelD{3,1},ydata_PannelD{3,1},'color',[0,0,0.7])

hold off
xlim([0 100]);
ylim([0 1]);
xticks([0:50:100]);
yticks([0:0.5:1]);
xlabel('Neurons per Population')
ylabel('Readout Accuracy')

box off
%
figure(6)
load("SEM_expE.mat")
patch([xdata_PannelE{2,1} fliplr(xdata_PannelE{2,1})], [ydata_PannelE{2,1}-SEM_expE'  fliplr(ydata_PannelE{2,1}+SEM_expE')], [1, 0, 0],'EdgeColor', [0,0,0])
hold on
plot(xdata_PannelE{2,1},ydata_PannelE{2,1},'color',[0.7,0,0])
hold on
load("SEM_poissE.mat")
patch([xdata_PannelE{3,1} fliplr(xdata_PannelE{3,1})], [ydata_PannelE{3,1}-SEM_poissE' fliplr(ydata_PannelE{3,1}+SEM_poissE')], [0 0 1],'EdgeColor', [0,0,0])
plot(xdata_PannelE{3,1},ydata_PannelE{3,1},'color',[0,0,0.7])
hold off

xlim([0 100]);
ylim([0 1]);
xticks([0:50:100]);
yticks([0:0.5:1]);
xlabel('Number of Distractors')

box off
%%

for fig_number=5:6
saveas(figure(fig_number),['FIGURE2Pannel',num2str(fig_number)],'jpg');
saveas(figure(fig_number),['FIGURE2Pannel',num2str(fig_number)],'fig');
saveas(figure(fig_number),['FIGURE2Pannel',num2str(fig_number)],'tif');
end

%This code will produce figure 2 pannels A,B,D,E
clear all
close all

GrphicSettings 

%Load data for plot
load('WORKSPACEExactDataForPlotF.mat')


GrphicSettingsTHINERLINE

figure(1)

patch([data_saver(1:6,end)' fliplr(data_saver(1:6,end)')], [all_means-SEM_F  fliplr(all_means+SEM_F)], [0 0.7 0],'EdgeColor', [0,0,0])
hold on
plot(data_saver(1:6,end)',all_means,'color',[0,1,0])
hold off

xlabel('Inter Population Correlation')
ylabel('Readout Accuracy')
xticks(0:0.025:0.05)
yticks(0:0.5:1)
ylim([0 1])
box off
%
saveas(figure(1),'FIGURE4PanneFAppendix','jpg');
saveas(figure(1),'FIGURE4PanneFAppendix','fig');
saveas(figure(1),'FIGURE4PanneFAppendix','tif');


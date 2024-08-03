%This code will produce figure 2 pannels A,B,D,E
clear all
close all

GrphicSettings 

%Load data for plot
load('WorkspaceE.mat')


GrphicSettingsTHINERLINE

figure(1)

patch([data_saver(1:6,4)' fliplr(data_saver(1:6,4)')], [all_means-SEM_E  fliplr(all_means+SEM_E)], [0 0.7 0],'EdgeColor', [0,0,0])
hold on
plot(data_saver(1:6,4)',all_means,'color',[0,1,0])
hold off

xlabel('Intra Population Correlation')
ylabel('Readout Accuracy')
xticks(0:0.025:0.05)
yticks(0:0.5:1)
ylim([0 1])
box off
%
saveas(figure(1),'FIGURE4PanneEAppendix','jpg');
saveas(figure(1),'FIGURE4PanneEAppendix','fig');
saveas(figure(1),'FIGURE4PanneEAppendix','tif');


%This code will produce figure 2 pannels A,B,D,E
clear all
close all

GrphicSettings 

%Load data for plot
load('WorkspaceD.mat')


GrphicSettingsTHINERLINE

figure(1)

patch([data_saver(1:109,2)' fliplr(data_saver(1:109,2)')], [all_means-SEM_D  fliplr(all_means+SEM_D)], [0 0.7 0],'EdgeColor', [0,0,0])
hold on
plot(data_saver(1:109,2)',all_means,'color',[0 0.7 0])
hold off

xlabel('Neurons per Population')
ylabel('Readout Accuracy')
ylim([0 1])
xticks(0:500:1000)
yticks([0 0.5 1])
box off
%
saveas(figure(1),'FIGURE4PanneDAppendix','jpg');
saveas(figure(1),'FIGURE4PanneDAppendix','fig');
saveas(figure(1),'FIGURE4PanneDAppendix','tif');


%This code will produce figure 2 pannels A,B,D,E
clear all
close all

GrphicSettings 

%Load data for plot
load('data_saver_mean_and_SEM.mat')


GrphicSettingsTHINERLINE

x=[ 1 10 100:100:5000]
mean_q_1=data_saver_mean_and_SEM(157:208,4)'
SEM_q_1=data_saver_mean_and_SEM(157:208,5)'
mean_q_2=data_saver_mean_and_SEM(105:156,4)'
SEM_q_2=data_saver_mean_and_SEM(105:156,5)'
mean_q_3=data_saver_mean_and_SEM(53:104,4)'
SEM_q_3=data_saver_mean_and_SEM(53:104,5)'
mean_q_4=data_saver_mean_and_SEM(1:52,4)'
SEM_q_4=data_saver_mean_and_SEM(1:52,5)'

figure(1)
patch([x fliplr(x)],[mean_q_1-SEM_q_1  fliplr(mean_q_1+SEM_q_1)], [0,0,1], 'EdgeColor', [0,0,0])
hold on
plot(x,mean_q_1,'color',[0 0 1])
hold on
patch([x fliplr(x)],[mean_q_2-SEM_q_2  fliplr(mean_q_2+SEM_q_2)], [0,0,0.85], 'EdgeColor', [0,0,0])
hold on
plot(x,mean_q_2,'color',[0,0,0.85])
hold on
patch([x fliplr(x)],[mean_q_3-SEM_q_3  fliplr(mean_q_3+SEM_q_3)], [0,0,0.7], 'EdgeColor', [0,0,0])
hold on
plot(x,mean_q_3,'color',[0,0,0.7])
hold on
patch([x fliplr(x)],[mean_q_4-SEM_q_4  fliplr(mean_q_4+SEM_q_4)], [0,0,0.55], 'EdgeColor', [0,0,0])
hold on
plot(x,mean_q_4,'color',[0,0,0.55])
hold on
% load("SEM_poissD.mat")
% patch([xdata_PannelD{3,1} fliplr(xdata_PannelD{3,1})], [ydata_PannelD{3,1}-SEM_poissD  fliplr(ydata_PannelD{3,1}+SEM_poissD)], [0 0 1],'EdgeColor', [0,0,0])
% plot(xdata_PannelD{3,1},ydata_PannelD{3,1},'color',[0,0,0.7])

hold off

xlim([0 5000]);
ylim([0 1]);
xticks([0:2500:5000]);
yticks([0 0.5 1]);
xlabel('Neurons per Population')
ylabel('Readout Accuracy')
box off

%%


saveas(figure(1),'FIGURE2Panneappendix','jpg');
saveas(figure(1),'FIGURE2Panneappendix','fig');
saveas(figure(1),'FIGURE2Panneappendix','tif');


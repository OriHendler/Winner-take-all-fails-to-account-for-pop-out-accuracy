%This code will produce figure 2 pannel H
clear all
close all

GrphicSettings 

%Load data for plot
load('data_saver_mean_and_SEM')
figure(1)
plot(data_saver_mean_and_SEM(1:26,2),data_saver_mean_and_SEM(79:104,4),'color',[0,0,1])
hold on
plot(data_saver_mean_and_SEM(1:26,2),data_saver_mean_and_SEM(53:78,4),'color',[0,0,0.85])
hold on
plot(data_saver_mean_and_SEM(1:26,2),data_saver_mean_and_SEM(27:52,4),'color',[0,0,0.7])
hold on
plot(data_saver_mean_and_SEM(1:26,2),data_saver_mean_and_SEM(1:26,4),'color',[0,0,0.55])
hold on
plot(data_saver_mean_and_SEM(1:26,2),1./data_saver_mean_and_SEM(1:26,2),'color',[0,0,0])
legend('q=1.5',"q=1.44","q=1.3","q=1.1","q=1",Location="northwest")
hold off
xlim([0 100]);
ylim([0 1]);
xticks([0:50:100]);
yticks([0:0.5:1]);
ylabel('Readout Accuracy')
xlabel('Number of Distractors')
box off

%%

 
saveas(figure(1),'FIGURE2PannelI','jpg');
saveas(figure(1),'FIGURE2PannelI','fig');
saveas(figure(1),'FIGURE2PannelI','tif');


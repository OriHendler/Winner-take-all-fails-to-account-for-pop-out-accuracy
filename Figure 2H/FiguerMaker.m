%This code will produce figure 2 pannel H
clear all
close all

GrphicSettings 

%Load data for plot
load('data_saver_mean_and_SEM')
figure(1)
plot(data_saver_mean_and_SEM(1:52,1),data_saver_mean_and_SEM(157:208,4),'color',[0,0,1])
hold on
plot(data_saver_mean_and_SEM(1:52,1),data_saver_mean_and_SEM(105:156,4),'color',[0,0,0.85])
hold on
plot(data_saver_mean_and_SEM(1:52,1),data_saver_mean_and_SEM(53:104,4),'color',[0,0,0.7])
hold on
plot(data_saver_mean_and_SEM(1:52,1),data_saver_mean_and_SEM(1:52,4),'color',[0,0,0.55])
hold on
plot([1 5000],[1/9 1/9],'color',[0,0,0])
legend('q=1.5',"q=1.44","q=1.3","q=1.1","q=1",Location="northwest")
xlim([0 5000]);
ylim([0 1]);
xticks([0:2500:5000]);
yticks([0:0.5:1]);
ylabel('Readout Accuracy')
xlabel('Neurons per Population')
box off

%%

 
saveas(figure(1),'FIGURE2PanneH','jpg');
saveas(figure(1),'FIGURE2PanneH','fig');
saveas(figure(1),'FIGURE2PanneH','tif');


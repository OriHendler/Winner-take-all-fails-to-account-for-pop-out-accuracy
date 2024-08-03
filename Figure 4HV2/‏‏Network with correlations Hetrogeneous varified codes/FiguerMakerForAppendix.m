%This code will produce figure 4 pannels H
%EDIT
clear all
close all

GrphicSettings 

%Load data for plot
load('data_saver_mean_and_SEM.mat')


GrphicSettingsTHINERLINE
x=data_saver_mean_and_SEM(1:1000,2)';
order=[2001:3000, 1001:2000,1:1000, 5001:6000 ,4001:5000 ,3001:4000, 8001:9000 ,7001:8000, 6001:7000]
color_order=[0 0 1;0 0 0.7;0 0 0.5;1 0 0;0.7 0 0;0.5 0 0;0 1 0;0 0.7 0;0 0.5 0]

figure(1)
for idx=1:9
patch([x, fliplr(x)], ...
      [data_saver_mean_and_SEM(order((idx-1)*1000+1:1000*idx),5)' - ...
       data_saver_mean_and_SEM(order((idx-1)*1000+1:1000*idx),6)', ...
       fliplr(data_saver_mean_and_SEM(order((idx-1)*1000+1:1000*idx),5)' + ...
               data_saver_mean_and_SEM(order((idx-1)*1000+1:1000*idx),6)')], ...
      color_order(idx,:), 'EdgeColor', [0 0 0]);
hold on
plot(x,data_saver_mean_and_SEM(order((idx-1)*1000+1:1000*idx),5)','color',color_order(idx,:))
end
% load("SEM_poissD.mat")
% patch([xdata_PannelD{3,1} fliplr(xdata_PannelD{3,1})], [ydata_PannelD{3,1}-SEM_poissD  fliplr(ydata_PannelD{3,1}+SEM_poissD)], [0 0 1],'EdgeColor', [0,0,0])
% plot(xdata_PannelD{3,1},ydata_PannelD{3,1},'color',[0,0,0.7])

hold off
xlim([0 1000]);
ylim([0 1]);
xticks([0:500:1000]);
yticks([0:0.5:1]);
ylabel('Readout Accuracy')
xlabel('Neurons per Population')
box off

%%


saveas(figure(1),'FIGURE4PannelGappendix','jpg');
saveas(figure(1),'FIGURE4PannelGappendix','fig');
saveas(figure(1),'FIGURE4PannelGappendix','tif');


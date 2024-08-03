%This code will produce figure 2 pannel H
% clear all
% close all
hold on
GrphicSettings 

%Load data for plot
load('data_saver_mean_and_SEM')
load('validation.mat')
order=[2001:3000, 1001:2000,1:1000, 5001:6000 ,4001:5000 ,3001:4000, 8001:9000 ,7001:8000, 6001:7000]
color_order=[0 0 1;0 0 0.7;0 0 0.5;1 0 0;0.7 0 0;0.5 0 0;0 1 0;0 0.7 0;0 0.5 0]
% figure(1)
for idx=1:9
scatter(data_saver_mean_and_SEM(1:27:1000,2),validation(order((idx-1)*1000+1:27:1000*idx)),"x",'LineWidth',2,'color',color_order(idx,:))
hold on
end
% legend('c=0 q=1.3',"c=0 q=1.2","c=0 q=1.1", ...
%     'c=0.01 q=1.3',"c=0.01 q=1.2","c=0.01 q=1.1", ...
%     'c=0.05 q=1.3',"c=0.05 q=1.2","c=0.05 q=1.1", ...
%     Location="southeast")

% Get handle to legend
legend_handle = findobj(gcf, 'Type', 'Legend');

% Add box around legend
set(legend_handle, 'Box', 'on');
set(legend_handle, 'EdgeColor', 'none');

hold off
xlim([0 1000]);
ylim([0 1]);
xticks([0:500:1000]);
yticks([0:0.5:1]);
ylabel('Readout Accuracy')
xlabel('Neurons per Population')
box off

%%

 
% saveas(figure(1),'FIGURE4PannelG','jpg');
% saveas(figure(1),'FIGURE4PannelG','fig');
% saveas(figure(1),'FIGURE4PannelG','tif');


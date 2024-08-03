%This code will produce figure 2 pannel H
clear all
close all

GrphicSettings 

%Load data for plot
load('data_saver_mean_and_SEM')
skip_size=6;
order=[1+2*skip_size:3*skip_size,1+skip_size:2*skip_size,1:skip_size...
    ,1+5*skip_size:6*skip_size,1+4*skip_size:5*skip_size,1+3*skip_size:4*skip_size...
     ,1+8*skip_size:9*skip_size,1+7*skip_size:8*skip_size,1+6*skip_size:7*skip_size]
color_order=[0 0 1;0 0 0.7;0 0 0.5;1 0 0;0.7 0 0;0.5 0 0;0 1 0;0 0.7 0;0 0.5 0]
figure(1)
for idx=1:9
scatter(data_saver_mean_and_SEM(1:skip_size,1),data_saver_mean_and_SEM(order((idx-1)*skip_size+1:skip_size*idx),5) ...
     ,15,'MarkerFaceColor', 'none' , 'LineWidth',1, 'MarkerEdgeColor',color_order(idx,:) )
hold on;

% Add error bars
errorbar(data_saver_mean_and_SEM(1:skip_size,1), data_saver_mean_and_SEM(order((idx-1)*skip_size+1:skip_size*idx),5), data_saver_mean_and_SEM(order((idx-1)*skip_size+1:skip_size*idx),6)', 'LineStyle', 'none', 'Color',color_order(idx,:), 'LineWidth',1); % 'r' is the color red, you can change it to your preferred color
hold on
end

hold off
xlim([0 100]);
ylim([0 1]);
xticks([0:50:100]);
yticks([0:0.5:1]);
ylabel('Readout Accuracy')
xlabel('Number of Distractors')
box off

%%

 
saveas(figure(1),'FIGURE4PannelHwithError','jpg');
saveas(figure(1),'FIGURE4PannelHwithError','fig');
saveas(figure(1),'FIGURE4PannelHwithError','tif');
exportgraphics(figure(1), 'FIGURE4PannelHwithError.pdf', 'ContentType', 'vector', 'Resolution', 600); % Adjust the resolution as needed


%This code will produce figure 2 pannels A,B,D,E
clear all
close all

GrphicSettings

%Importing data:
open('N100M48MorSQUERED.fig');
a = get(gca,'Children');
xdata_PannelA = get(a, 'XData');
ydata_PannelA = get(a, 'YData');
%
open('M100N100ExpPoisMorSQUERE.fig');
a = get(gca,'Children');
xdata_PannelB = get(a, 'XData');
ydata_PannelB = get(a, 'YData');
%
open('N100M48MorSQUERE.fig');
a = get(gca,'Children');
xdata_PannelD = get(a, 'XData');
ydata_PannelD = get(a, 'YData');
%
open('M100N100SQURED.fig');
a = get(gca,'Children');
xdata_PannelE = get(a, 'XData');
ydata_PannelE = get(a, 'YData');

%%
close all
%

figure(1)
plot(xdata_PannelA{2,1},ydata_PannelA{2,1},'color',[1,0,0])
hold on
plot(xdata_PannelA{3,1},ydata_PannelA{3,1},'color',[0,0,1])
hold off
xlim([0 100]);
ylim([0 1]);
xticks([0:50:100]);
yticks([0:0.5:1]);
ylabel('Readout Accuracy')

box off
%

figure(2)
plot(xdata_PannelB{2,1},ydata_PannelB{2,1},'color',[1,0,0])
hold on
plot(xdata_PannelB{3,1},ydata_PannelB{3,1},'color',[0,0,1])
hold off
xlim([0 100]);
ylim([0 1]);
xticks([0:50:100]);
yticks([0:0.5:1]);

box off
%
figure(3)
plot(xdata_PannelD{2,1},ydata_PannelD{2,1},'color',[1,0,0])
hold on
plot(xdata_PannelD{3,1},ydata_PannelD{3,1},'color',[0,0,1])
hold off
xlim([0 100]);
ylim([0 1]);
xticks([0:50:100]);
yticks([0:0.5:1]);
xlabel('Neurons per Population')
ylabel('Readout Accuracy')

box off
%
figure(4)
plot(xdata_PannelE{2,1},ydata_PannelE{2,1},'color',[1,0,0])
hold on
plot(xdata_PannelE{3,1},ydata_PannelE{3,1},'color',[0,0,1])
hold off

xlim([0 100]);
ylim([0 1]);
xticks([0:50:100]);
yticks([0:0.5:1]);
xlabel('Number of Distractors')

box off
%%

for fig_number=1:4 
saveas(figure(fig_number),['FIGURE2Pannel',num2str(fig_number)],'jpg');
saveas(figure(fig_number),['FIGURE2Pannel',num2str(fig_number)],'fig');
saveas(figure(fig_number),['FIGURE2Pannel',num2str(fig_number)],'tif');
end
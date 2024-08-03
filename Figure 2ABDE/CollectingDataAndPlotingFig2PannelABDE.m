%This code will produce figure 2 pannels A,B,D,E
clear all
close all

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
set(0, 'DefaultAxesFontName', 'Helvetica');
set(groot,'defaultLineLineWidth',2) 
set(0,'DefaultaxesLineWidth', 1.5)
set(0,'DefaultaxesFontSize', 30) 
set(0,'DefaultaxesFontWeight', 'bold') 
set(0,'DefaultTextFontSize', 32) 
set(0,'DefaultaxesFontName', 'Helvetica') 
set(0,'DefaultlegendFontName', 'Helvetica')
set(0, 'TickDir', 'out')
set(0, 'box' , 'off')
%
close all
%

figure(1)
plot(xdata_PannelA{2,1},ydata_PannelA{2,1},'color',[1,0,0],LineWidth=3)
hold on
plot(xdata_PannelA{3,1},ydata_PannelA{3,1},'color',[0,0,1],LineWidth=3)
hold off
xlim([0 100]);
ylim([0 1]);
xticks([0:50:100]);
yticks([0:0.5:1]);

figure(2)
plot(xdata_PannelB{2,1},ydata_PannelB{2,1},'color',[1,0,0],LineWidth=3)
hold on
plot(xdata_PannelB{3,1},ydata_PannelB{3,1},'color',[0,0,1],LineWidth=3)
hold off
xlim([0 100]);
ylim([0 1]);
xticks([0:50:100]);
yticks([0:0.5:1]);

figure(3)
plot(xdata_PannelD{2,1},ydata_PannelD{2,1},'color',[1,0,0],LineWidth=3)
hold on
plot(xdata_PannelD{3,1},ydata_PannelD{3,1},'color',[0,0,1],LineWidth=3)
hold off
xlim([0 100]);
ylim([0 1]);
xticks([0:50:100]);
yticks([0:0.5:1]);

figure(4)
plot(xdata_PannelE{2,1},ydata_PannelE{2,1},'color',[1,0,0],LineWidth=3)
hold on
plot(xdata_PannelE{3,1},ydata_PannelE{3,1},'color',[0,0,1],LineWidth=3)
hold off

xlim([0 100]);
ylim([0 1]);
xticks([0:50:100]);
yticks([0:0.5:1]);
%%


 


% x0=10;
% y0=10;
% width=650;
% height=650;
% set(gcf,'position',[x0,y0,width,height])

% saveas(figure(41),'M9Nchangingmeann13var4mu_for_expChanging.jpg','jpg');
% saveas(figure(41),'M9Nchangingmeann13var4mu_for_expChanging.fig','fig');
% saveas(figure(41),'M9Nchangingmeann13var4mu_for_expChanging.tif','tif');


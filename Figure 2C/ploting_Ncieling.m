%This code is used to plot the inset of figure 2B
clear all
close all
    %%
set(0, 'DefaultAxesFontName', 'Helvetica');
set(groot,'defaultLineLineWidth',2) 
set(0,'DefaultaxesLineWidth', 1.5)
set(0,'DefaultaxesFontSize', 16) 
set(0,'DefaultaxesFontWeight', 'bold') 
set(0,'DefaultTextFontSize', 16) 
set(0,'DefaultaxesFontName', 'Helvetica') 
set(0,'DefaultlegendFontName', 'Helvetica')

%
T = readtable("Finding Pcieling.xlsx",'Range','L4:N15');

for i=[3 2 1]
scatter([8,15,24,35],T.Var2([i,i+3,i+6,i+9]))
hold on
end


%%
set(gca, 'TickDir', 'out')
xlabel('Number of Distractors (M)')
ylabel('N_{ceil}')
title('Nine Heterogeneous Populations')
% subtitle('15 Distractors, 100 Neurons per Population',FontSize=18,FontWeight='bold')
box off
legend('P_{ceil}=0.9','P_{ceil}=0.8','P_{ceil}=0.7',Location='northwest');
legend boxoff  
yticks([0 3*10^4:3*10^4:15*10^4])
xticks([0 7:7:35])
ylim([0 15*10^4])
x0=10;
y0=10;
width=600;
height=600;
set(gcf,'position',[x0,y0,width,height])

% saveas(figure(41),'M9Nchangingmeann13var4mu_for_expChanging.jpg','jpg');
% saveas(figure(41),'M9Nchangingmeann13var4mu_for_expChanging.fig','fig');
% saveas(figure(41),'M9Nchangingmeann13var4mu_for_expChanging.tif','tif');
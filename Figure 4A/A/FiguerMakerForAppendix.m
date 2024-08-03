clear all
close all

GrphicSettingsTHINERLINE

figure(1)
clear all
close all

Mar=[8 99 323 899];
mu=12.8*0.2;
q=1.3;
Nar=[1 10 20:10:240 250];
colors = distinguishable_colors(length(Mar)+1);
colors(4,:)=colors(end,:);
for Mind = 1:length(Mar)
for Nind=1:length(Nar)
N= Nar(Nind);
sigma=sqrt(mu/(q*N));
%

correct_readout=0; %initialise for next loop
M = Mar(Mind);

%Simulation for max of gaussains
for Simulationind=1:5000
Distracotr_FR=normrnd(mu/q,sigma,M,1);
Target_FR=normrnd(mu,sigma*(sqrt(q)),1,1);
if Target_FR>max(Distracotr_FR)
    correct_readout=correct_readout+1;
end
end
Correct_readout_saver(Mind,Nind)=correct_readout/5000;

end

SEM=sqrt(Correct_readout_saver.*(1-Correct_readout_saver)/5000);

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
GrphicSettingsTHINERLINE


figure(1)
scatter(Nar,Correct_readout_saver(Mind,:),15,color=colors(Mind,:))
hold on
errorbar(Nar,Correct_readout_saver(Mind,:),SEM(Mind,:), 'LineStyle', 'none', 'Color',colors(Mind,:), 'LineWidth',1); % 'r' is the color red, you can change it to your preferred color
hold on
end


ylim([0,1])
xlim([0,250])
yticks([0 0.5 1])
xticks([0 125 250])
%%
set(gca, 'TickDir', 'out')
xlabel('Neurons per Population')
ylabel('Readout Accuracy')
%
%
% legend('Eight Distracotrs','','','35 Distracotrs',Location='best')
% % legend('Approximation','Simulation','Numerical Solution',Location='best')
% legend('boxoff')
% % subtitle('15 Distractors, 100 Neurons per Population',FontSize=18,FontWeight='bold')
box off

%
x0=10;
y0=10;
width=600;
height=600;
set(gcf,'position',[x0,y0,width,height])

saveas(figure(1),'MrangeNchangingqThireenOverTenHeavisideSimulationsGumbelAPENDIX','jpg');
saveas(figure(1),'MrangeNchangingqThireenOverTenHeavisideSimulationsGumbelAPENDIX','fig');
saveas(figure(1),'MrangeNchangingqThireenOverTenHeavisideSimulationsGumbelAPENDIX','tif');
exportgraphics(figure(1), 'MrangeNchangingqThireenOverTenHeavisideSimulationsGumbelAPENDIX.pdf', 'ContentType', 'vector', 'Resolution', 600); % Adjust the resolution as needed









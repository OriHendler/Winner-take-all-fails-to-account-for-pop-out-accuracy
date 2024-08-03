clear all
close all

Mar=[1:3:10 20:40:980 1000];
mu=12.8*0.2;
q=1.3;
Nar=[1 20 50 100 200];

colors = distinguishable_colors(length(Nar)+1);
colors(4,:)=colors(end,:);

for Nind=1:length(Nar)
N= Nar(Nind);
sigma=sqrt(mu/(q*N));
%
for Mind = 1:length(Mar)
correct_readout=0; %initialise for next loop
M = Mar(Mind);


%Simulation for max of gaussains
for Simulationind=1:50000
Distracotr_FR=normrnd(mu/q,sigma,M,1);
Target_FR=normrnd(mu,sigma*(sqrt(q)),1,1);
if Target_FR>max(Distracotr_FR)
    correct_readout=correct_readout+1;
end
end
Correct_readout_saver(Nind,Mind)=correct_readout/50000;

end
SEM=sqrt(Correct_readout_saver.*(1-Correct_readout_saver)/50000);

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
scatter(Mar,Correct_readout_saver(Nind,:),15,Color=colors(Nind,:))
hold on
% Add error bars
errorbar(Mar,Correct_readout_saver(Nind,:),SEM(Nind,:), 'LineStyle', 'none', 'Color',colors(Nind,:), 'LineWidth',1); % 'r' is the color red, you can change it to your preferred color
hold on
end

   

%%
set(gca, 'TickDir', 'out')
xlim([0 1000])
ylim([0 1])
xticks([0 500 1000])
yticks([0 0.5 1])

xlabel('Number of Distractors')
ylabel('Readout Accuracy')
% legend('Simulation','Approximation','Chance Value')
% legend('boxoff')
% % subtitle('15 Distractors, 100 Neurons per Population',FontSize=18,FontWeight='bold')
box off

x0=10;
y0=10;
width=600;
height=600;
set(gcf,'position',[x0,y0,width,height])

saveas(figure(1),'MchangingNrangeqthirteenOverTenHeavisideSimulationsGumbelAPPENDIX','jpg');
saveas(figure(1),'MchangingNrangeqthirteenOverTenHeavisideSimulationsGumbelAPPENDIX','fig');
saveas(figure(1),'MchangingNrangeqthirteenOverTenHeavisideSimulationsGumbelAPPENDIX','tif');
exportgraphics(figure(1), 'MchangingNrangeqthirteenOverTenHeavisideSimulationsGumbelAPPENDIX.pdf', 'ContentType', 'vector', 'Resolution', 600); % Adjust the resolution as needed



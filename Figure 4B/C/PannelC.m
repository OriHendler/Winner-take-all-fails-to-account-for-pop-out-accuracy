clear all
close all
load("POPMchangingNchanging-date-22_12_31_17_36_42-meann12.8var4ExponentialMeanElevenOverTen")
plotPcVsN=0;
plotPcVsM=1;


if plotPcVsN
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
%
am = (sqrt(2*log(M)))/(sigma);
bm = mu/q+(sqrt(2*log(M)) - 0.5*(log(log(M)) + log(4*pi))./sqrt(2*log(M)))*(sigma);
%
%Analytical solution with gambel and window approximation
p = @(x,m,s) exp(-((x-m).^2)/(2*s.^2)) / (s*sqrt(2*pi));
c = integral(@(x) p(x, mu, sigma*sqrt(q)), bm, inf);
c_saver(Nind)=c;

%Analytical solution with gambel apporixmation but without window
%aprroximation
xvec=-20:0.01:20;
% Argoment=exp(-exp(-(x-bm)*am))*normpdf(x,mu,sigma);
Gussian=normpdf(xvec,mu,sigma*sqrt(q));
% plot(Gussian)
% hold on
GambelCdf=exp(-exp(-(xvec-bm)*am));
% plot(GambelCdf)
% hold on
Argoment=Gussian.*GambelCdf;
% plot(Argoment)
% P_c_function=vpaintegral(Argoment, -inf, inf);
P_c_function=trapz(xvec,Argoment);

%
P_c_saver(Nind)=P_c_function;

%Simulation for max of gaussains
for Simulationind=1:5000
Distracotr_FR=normrnd(mu/q,sigma,M,1);
Target_FR=normrnd(mu,sigma*(sqrt(q)),1,1);
if Target_FR>max(Distracotr_FR)
    correct_readout=correct_readout+1;
end
end
Correct_readout_saver(Nind)=correct_readout/5000;

end



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
figure(1)
plot(Nar,c_saver,'--',Color=colors(Mind,:))
hold on
plot(Nar,Correct_readout_saver,'o',Color=colors(Mind,:))
hold on
plot(Nar,P_c_saver,'-',Color=colors(Mind,:))
hold on
% plot(Nar,mean_correct_readout_saver_all_realizations_matrix(1+19*(Mind-1):19*Mind,1),'k')
% hold on







end


ylim([0,1])
%%
set(gca, 'TickDir', 'out')
xlabel('Number of Neurons per Population (N)')
ylabel('Readout Accuracy')
title('Strong contextual modulation strength (q)')
% legend('Eight Distracotrs','','','35 Distracotrs',Location='best')
% % legend('Approximation','Simulation','Numerical Solution',Location='best')
% legend('boxoff')
% % subtitle('15 Distractors, 100 Neurons per Population',FontSize=18,FontWeight='bold')
box off
%
txt = ['M: ']
text(50,0.23,txt,"FontWeight","bold","FontName",'Helvetica')
for Midx=1:length(Mar)
txt = [' ' num2str(Mar(Midx)) ];
text(65,0.23-(Midx-1)*0.04,txt,"Color",colors(Midx,:),"FontWeight","bold","FontName",'Helvetica')
end
txt= ['-- Heaviside Approx'];
text(110,0.23,txt,"FontWeight","bold","FontName",'Helvetica')
txt= ['\circ \circ Simulations'];
text(110,0.19,txt,"FontWeight","bold","FontName",'Helvetica')
txt= ['__ Gumbel Approx'];
text(110,0.15,txt,"FontWeight","bold","FontName",'Helvetica')
%
x0=10;
y0=10;
width=600;
height=600;
set(gcf,'position',[x0,y0,width,height])

saveas(figure(1),'MrangeNchangingqThireenOverTenHeavisideSimulationsGumbel','jpg');
saveas(figure(1),'MrangeNchangingqThireenOverTenHeavisideSimulationsGumbel','fig');
saveas(figure(1),'MrangeNchangingqThireenOverTenHeavisideSimulationsGumbel','tif');

end













%%

if plotPcVsM

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
%
am = (sqrt(2*log(M)))/sigma;
bm = mu/q+(sqrt(2*log(M)) - 0.5*(log(log(M)) + log(4*pi))./sqrt(2*log(M)))*sigma;
%

p = @(x,m,s) exp(-((x-m).^2)/(2*s.^2)) / (s*sqrt(2*pi));
c = integral(@(x) p(x, mu, sigma*sqrt(q)), bm, inf);
c_saver(Mind)=c;

%Analytical solution with gambel apporixmation but without window
%aprroximation
xvec=-20:0.01:20;
% Argoment=exp(-exp(-(x-bm)*am))*normpdf(x,mu,sigma);
Gussian=normpdf(xvec,mu,sigma*sqrt(q));
% plot(Gussian)
% hold on
GambelCdf=exp(-exp(-(xvec-bm)*am));
% plot(GambelCdf)
% hold on
Argoment=Gussian.*GambelCdf;
% plot(Argoment)
% P_c_function=vpaintegral(Argoment, -inf, inf);
P_c_function=trapz(xvec,Argoment);

%
P_c_saver(Mind)=P_c_function;

%Simulation for max of gaussains
for Simulationind=1:10000
Distracotr_FR=normrnd(mu/q,sigma,M,1);
Target_FR=normrnd(mu,sigma*(sqrt(q)),1,1);
if Target_FR>max(Distracotr_FR)
    correct_readout=correct_readout+1;
end
end
Correct_readout_saver(Mind)=correct_readout/10000;

end
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
figure(1)
plot(Mar,c_saver,'--',Color=colors(Nind,:))
hold on
plot(Mar,Correct_readout_saver,'o',Color=colors(Nind,:))
hold on
plot(Mar,P_c_saver,'-',Color=colors(Nind,:))
hold on
plot(Mar,1./Mar,'k')



end

   

%%
set(gca, 'TickDir', 'out')
xlabel('Number of Distractors (M)')
ylabel('Readout Accuracy')
title('Strong contextual modulation strength (q)')
% legend('Simulation','Approximation','Chance Value')
% legend('boxoff')
% % subtitle('15 Distractors, 100 Neurons per Population',FontSize=18,FontWeight='bold')
box off

%
txt = ['N: ']
text(380,0.4,txt,"FontWeight","bold","FontName",'Helvetica')
for Nidx=1:length(Nar)
txt = [' ' num2str(Nar(length(Nar)+1-Nidx)) ];
text(420,0.4-(Nidx-1)*0.04,txt,"Color",colors(length(Nar)+1-Nidx,:),"FontWeight","bold","FontName",'Helvetica')
end
txt= ['-- Heaviside Approx'];
text(550,0.36,txt,"FontWeight","bold","FontName",'Helvetica')
txt= ['\circ \circ Simulations'];
text(550,0.32,txt,"FontWeight","bold","FontName",'Helvetica')
txt= ['__ Gumbel Approx'];
text(550,0.28,txt,"FontWeight","bold","FontName",'Helvetica')
%


x0=10;
y0=10;
width=600;
height=600;
set(gcf,'position',[x0,y0,width,height])

saveas(figure(1),'MchangingNrangeqthirteenOverTenHeavisideSimulationsGumbel','jpg');
saveas(figure(1),'MchangingNrangeqthirteenOverTenHeavisideSimulationsGumbel','fig');
saveas(figure(1),'MchangingNrangeqthirteenOverTenHeavisideSimulationsGumbel','tif');


end
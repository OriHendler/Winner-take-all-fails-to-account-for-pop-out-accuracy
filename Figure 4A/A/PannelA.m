clear all
close all
load("POPMchangingNchanging-date-22_12_31_17_36_42-meann12.8var4ExponentialMeanElevenOverTen")
plotPcVsN=1;
plotPcVsM=0;


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
GrphicSettings


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
txt = ['M: ']
text(50,0.23,txt,"FontWeight","bold","FontName",'Helvetica')
for Midx=1:length(Mar)
txt = [' ' num2str(Mar(Midx)) ];
text(65,0.23-(Midx-1)*0.04,txt,"Color",colors(Midx,:),"FontWeight","bold","FontName",'Helvetica')
end
txt= ['-- Equation 17'];
text(110,0.23,txt,"FontWeight","bold","FontName",'Helvetica')
txt= ['\circ \circ Simulations'];
text(110,0.19,txt,"FontWeight","bold","FontName",'Helvetica')
txt= ['__ Equation 16'];
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

Mar=[10:10:1000];
mu=12.8*0.2;
q=1.1;
Nar=1;

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

%Simulation for max of gaussains
for Simulationind=1:5000
Distracotr_FR=normrnd(mu/q,sigma,M,1);
Target_FR=normrnd(mu,sigma*(sqrt(q)),1,1);
if Target_FR>max(Distracotr_FR)
    correct_readout=correct_readout+1;
end
end
Correct_readout_saver(Mind)=correct_readout/5000;

end
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
plot(Mar,Correct_readout_saver,'b')
hold on
plot(Mar,c_saver,'r')
hold on
plot(Mar,1./Mar,'k')

ylim([0,0.2])

%%
set(gca, 'TickDir', 'out')
xlabel('Number of Distractors (M)')
ylabel('Readout Accuracy')
title('One Neuron per Population')
legend('Simulation','Approximation','Chance Value')
legend('boxoff')
% subtitle('15 Distractors, 100 Neurons per Population',FontSize=18,FontWeight='bold')
box off
x0=10;
y0=10;
width=600;
height=600;
set(gcf,'position',[x0,y0,width,height])

% saveas(figure(1),'MchangingN1meann13qElevenOverTen','jpg');
% saveas(figure(1),'MchangingN1meann13qElevenOverTen','fig');
% saveas(figure(1),'MchangingN1meann13qElevenOverTen','tif');


end
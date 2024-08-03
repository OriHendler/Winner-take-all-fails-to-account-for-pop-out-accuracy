Mar=8;
mu=12.8*0.2;
q=1.1;
Nar=[10:10:100, 200:100:1000];

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
c_saver(Nind)=c;

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
plot(Nar,Correct_readout_saver,'b')
hold on
plot(Nar,c_saver,'r')
hold on
plot(Nar,mean_correct_readout_saver_all_realizations_matrix(1:length(Nar),1))
ylim([0,1])
%%
set(gca, 'TickDir', 'out')
xlabel('Number of Neurons per Population (N)')
ylabel('Readout Accuracy')
title('99 Distractors (M)')
legend('Simulation','Approximation',Location='southeast')
legend('boxoff')
% subtitle('15 Distractors, 100 Neurons per Population',FontSize=18,FontWeight='bold')
box off
x0=10;
y0=10;
width=600;
height=600;
set(gcf,'position',[x0,y0,width,height])

% saveas(figure(1),'M99Nchangingmeann13qThireenOverTen','jpg');
% saveas(figure(1),'M99Nchangingmeann13qThireenOverTen','fig');
% saveas(figure(1),'M99Nchangingmeann13qThireenOverTen','tif');

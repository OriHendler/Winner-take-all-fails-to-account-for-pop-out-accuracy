clear all
close all

load("CMC_analysis.mat")
load("SavedR1R2ValuesPhase")
CELLS=struct2cell(FR);

for n=1:65
FR_POP(:,n)=cell2mat(CELLS(2,:,n))
end

q=FR_POP(3,:)./FR_POP(2,:)


%%
set(0, 'DefaultAxesFontName', 'Helvetica');
set(groot,'defaultLineLineWidth',2) 
set(0,'DefaultaxesLineWidth', 1.5)
set(0,'DefaultaxesFontSize', 24) 
set(0,'DefaultaxesFontWeight', 'bold') 
set(0,'DefaultTextFontSize', 24) 
set(0,'DefaultaxesFontName', 'Helvetica') 
set(0,'DefaultlegendFontName', 'Helvetica')

%

scatter(FR_POP(3,:),q)
hold on
scatter(R1_values_Phase*5,R1_values_Phase./R2_values_phase,'r')
xlabel('FR to pop-out')
ylabel('q')


%%
%The neuron with the maximal q value (secluding some first 
%aunusual or noisy neurons) is neuron #21 in the original datasaet.
Chosen_mean_FR_pop=mean(FR(21).Data(3,:));
Chosen_std_FR_pop=std(FR(21).Data(3,:));
Chosen_mean_FR_uniform=mean(FR(21).Data(2,:));
Chosen_std_FR_uniform=std(FR(21).Data(2,:));

figure(2)
bar([1 2],[Chosen_mean_FR_uniform Chosen_mean_FR_pop],0.2,'b')
hold on

er = errorbar([1 2],[Chosen_mean_FR_uniform , Chosen_mean_FR_pop],[Chosen_std_FR_uniform/2 , Chosen_std_FR_pop/2],[Chosen_std_FR_uniform/2 , Chosen_std_FR_pop/2]);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
er.LineWidth=1.5;
hold off
%%
set(gca,'FontSize',32)
set(gca, 'TickDir', 'out')
set(gca,'xticklabel',[])
xlabel('')
ylabel('Firing Rate (Hz)','FontSize',30)
title('')
% subtitle('15 Distractors, 100 Neurons per Population',FontSize=18,FontWeight='bold')
box off
ylim([0 20])
% xlim([0 24])
% xticks([0:10:20])
yticks([0 10 20])

x0=10;
y0=10;
width=650;
height=650;
set(gcf,'position',[x0,y0,width,height])

saveas(figure(2),'ConteuxalModulatedNeuronFish','jpg');
saveas(figure(2),'ConteuxalModulatedNeuronFish','fig');
saveas(figure(2),'ConteuxalModulatedNeuronFish','tif');
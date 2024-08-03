%Instructions: use this code for each N seperatly. you can see in the
%summer vriable the CDF of particpation of neurons. for example for N=10 we
%reach 50% for a sum of 3 neurons.
N=1000
winning_target_neuron_index_simulation_No_Zeros=winning_target_neuron_index_simulation(winning_target_neuron_index_simulation~=0);
readout_accuracy=sum(correct_readout)/length(correct_readout)

h=histogram(winning_target_neuron_index_simulation_No_Zeros,N)
Neurons_sroted_by_participation_rate=sort(h.Values,'descend')
close all
b=bar(Neurons_sroted_by_participation_rate./sum(correct_readout))

for k=1:N
summer(k,1)=sum(b.YData(1:k));
end
participation=sum(b.YData~=0)/N

% y_for_scatter=Neurons_sroted_by_participation_rate./sum(correct_readout)
% close all
% GrphicSettings
% figure(1)
% scatter(1:length(y_for_scatter),y_for_scatter,'blue','filled')
% hold on
% % plot(x{1,1},y{1,1},'Color','blue','LineStyle','--')
% xlim([0 1000])
% ylim([0 0.1])
% xticks([0 500 1000])
% yticks([0 0.05 0.1])
% xlabel('Neuron Index')
% ylabel('Participation Rate')
% title('')
% 
% saveas(figure(1),'PartipiationRateVSneuronIndexN1000','fig')
% saveas(figure(1),'PartipiationRateVSneuronIndexN1000','jpg')
% saveas(figure(1),'PartipiationRateVSneuronIndexN1000','tif')
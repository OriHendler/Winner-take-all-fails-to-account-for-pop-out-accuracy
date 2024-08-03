function [distractor_neurons_rate_parameters]=network_of_distractor_neurons(q,target_neurons_rate_parameters)             

%  target_neurons_rate_parameters=q.*distractor_neurons_rate_parameters; %create N*(M+1) target neurons
distractor_neurons_rate_parameters=1./q.*target_neurons_rate_parameters; %create N*(M+1) target neurons
end  
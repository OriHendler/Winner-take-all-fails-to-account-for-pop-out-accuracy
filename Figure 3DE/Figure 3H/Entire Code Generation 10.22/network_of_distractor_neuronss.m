function [target_neurons_rate_parameters]=network_of_target_neurons(M,N,mu,sigma,time_window)
     
 target_neurons_rate_parameters= time_window*lognrnd(mu,sigma,M,N); %create N distractor neuron rate parameters for the M'th population

end        


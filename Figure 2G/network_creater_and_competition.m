%This code creates the network and then runs simulations of the wta
%or population competition, or both.

%Let's have a fresh start ok?
clearvars -except experimant X %deletes all variables except X in workspace
close all

%So dear researcher, what are we going to do now?
create_network=1;
time_for_competition=1;
w_t_a=1;
p_o_p=0;

%So dear, which case are we looking at?
homogeneous=0;
heterogeneous=1;

%General settings for all cases
number_of_variabls_tested=0; %Just initial vale so it works in the loop
for M=[49] %Number of distractors+1
for N=[100] %Number of neurons per population
N
bar_location=1;
time_window=0.2; %The time window relevant for spike count
meann = 12.8; % Mean
variance = 4; 
if homogeneous
    variance=0; % Variance- if homogeneous case, set to zero
end
mu = log((meann^2)/sqrt(variance+meann^2));
sigma = sqrt(log(variance/(meann^2)+1));
rounds=10000; %Number of rounds per simulation

%Spesific settings for the case in hand
if homogeneous
    ratio=1.5; %This is the ratio between the target and distractor rate parameter
    uniform_min=0;
    uniform_max=0;
    mu_for_exp_vec=0*ones(1,1);
end

if heterogeneous
    uniform_min=1.1; %The min value of the contexual modulation index
    uniform_max=1.1; %The nax value of the contexual modulation index
    ratio=0;
    mu_for_exp_vec=[0.3];
end

for index=1:length(mu_for_exp_vec)
number_of_variabls_tested=number_of_variabls_tested+1; % counting the loop number of testing N and q
mu_for_exp=mu_for_exp_vec(index);
%%Creating network with global parameters
if create_network

%Create contexual modulation strength values for all neurons
    q= contexual_modulation_strength(M,N,homogeneous,heterogeneous,ratio,uniform_min,uniform_max,mu_for_exp);

%Create distractor neurons for all populations
    target_neurons_rate_parameters= network_of_target_neurons(M,N,mu,sigma,time_window);

%Create target neurons for all populations
    distractor_neurons_rate_parameters= network_of_distractor_neurons(q,target_neurons_rate_parameters);
end

%%Winner-take-all competition and population-competition-model
if time_for_competition
    
    if w_t_a

    [correct_readout,winning_target_neuron_index_simulation,winning_target_neuron_firing_rate_simulation,winning_distractor_population_index_simulation,winning_distractor_neuron_firing_rate_simulation]=the_competition(target_neurons_rate_parameters,distractor_neurons_rate_parameters,rounds,bar_location,M,N);

        correct_readout_saver(number_of_variabls_tested,1)=mean(correct_readout);
        correct_readout_saver(number_of_variabls_tested,2)=N;
        correct_readout_saver(number_of_variabls_tested,3)=M;
        correct_readout_saver(number_of_variabls_tested,4)=mu_for_exp;

   [correct_readout_exp,winning_target_neuron_index_simulation_exp,winning_target_neuron_firing_rate_simulation_exp,winning_distractor_population_index_simulation_exp,winning_distractor_neuron_firing_rate_simulation_exp]=the_competition_with_exprnd(target_neurons_rate_parameters,distractor_neurons_rate_parameters,rounds,bar_location,M,N);
        correct_readout_saver(number_of_variabls_tested,5)=mean(correct_readout_exp);

    end

    if p_o_p
        winning_population_index_simulation_saver=0*ones(M,rounds);

     [correct_readout,winning_population_index_simulation]= the_competitionPOP(target_neurons_rate_parameters,distractor_neurons_rate_parameters,rounds,bar_location,M,N);
        correct_readout_saver(number_of_variabls_tested,1)=mean(correct_readout);
        correct_readout_saver(number_of_variabls_tested,2)=N;
        correct_readout_saver(number_of_variabls_tested,3)=M;
        correct_readout_saver(number_of_variabls_tested,4)=mu_for_exp;
    end
end

end
end
end
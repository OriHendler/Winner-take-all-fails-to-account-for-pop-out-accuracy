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
N=1000; %Number of neurons per population
M=9; %Number of distractors+1

% bar_location_vec=1:1:M; %Pick the target population out of the M+1 options
bar_location_vec=1; %Pick the target population out of the M+1 options

time_window=0.2; %The time window relevant for spike count
meann = 13; % Mean
variance = 4; 
if homogeneous
    variance=0; % Variance- if homogeneous case, set to zero
end
mu = log((meann^2)/sqrt(variance+meann^2));
sigma = sqrt(log(variance/(meann^2)+1));
rounds=1000; %Number of rounds per simulation

%Spesific settings for the case in hand
if homogeneous
    ratio=1; %This is the ratio between the target and distractor rate parameter
    uniform_min=0;
    uniform_max=0;
    mu_for_exp=0;
end

if heterogeneous
    uniform_min=1.15; %The min value of the contexual modulation index
    uniform_max=1.55; %The nax value of the contexual modulation index
    ratio=0;
    mu_for_exp=1.44;
end 

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
         for bar_location=bar_location_vec
    [correct_readout,winning_target_neuron_index_simulation,winning_target_neuron_firing_rate_simulation,winning_distractor_population_index_simulation,winning_distractor_neuron_firing_rate_simulation]=the_competition(target_neurons_rate_parameters,distractor_neurons_rate_parameters,rounds,bar_location,M,N);
         end
    end

    if p_o_p
        winning_population_index_simulation_saver=0*ones(M,rounds);
        for bar_location=bar_location_vec
     [correct_readout,winning_population_index_simulation]= the_competitionPOP(target_neurons_rate_parameters,distractor_neurons_rate_parameters,rounds,bar_location,M,N);
        winning_population_index_simulation_saver(bar_location,:)=winning_population_index_simulation;
        end
    end
end


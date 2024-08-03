function[correct_readout,winning_target_neuron_index_simulation,winning_target_neuron_firing_rate_simulation,winning_distractor_population_index_simulation,winning_distractor_neuron_firing_rate_simulation]= the_competition(target_neurons_rate_parameters,distractor_neurons_rate_parameters,rounds,bar_location,M,N)

correct_readout=0*ones(1,rounds); %start with zero correct and zero incorrect readouts ofcourse
winning_target_neuron_index_simulation=0*ones(1,rounds);
winning_target_neuron_firing_rate_simulation=0*ones(1,rounds);
winning_distractor_population_index_simulation=0*ones(1,rounds);
winning_distractor_neuron_firing_rate_simulation=0*ones(1,rounds);
target_firing_rate_this_round=0*ones(M,N);
distractor_firing_rate_this_round=0*ones(M,N);

for actual_round=1:rounds

for population_number=1:M
target_firing_rate_this_round(population_number,:)=exprnd(target_neurons_rate_parameters(population_number,:)); %gives possion noise to the target neurons
distractor_firing_rate_this_round(population_number,:)=exprnd(distractor_neurons_rate_parameters(population_number,:)); %gives possion noise to the distractor neurons
end

%Winner-take-all competition
most_active_neuron_in_target_population_rate= max(target_firing_rate_this_round(bar_location,:),[],2);%finds the rate of the most active neuron in the target population
most_active_neuron_in_disractor_population_rate= max(distractor_firing_rate_this_round,[],2);%finds the rate of the most active neuron in each distractor population
most_active_neuron_in_disractor_population_rate(bar_location)=0;
%Finding the number of most active target neurons and selecting one candidate at random:
most_active_neuron_in_target_population_Index=find(target_firing_rate_this_round(bar_location,:)==most_active_neuron_in_target_population_rate); %finding the index of the most active neurons in the target population
number_of_possible_target_neurons = numel(most_active_neuron_in_target_population_Index); % determines the number of most active neurons in the target population
i = randi(number_of_possible_target_neurons); % returns a random integer between 1 and the number of most active target neurons
selected_neuron_in_target_population_index = most_active_neuron_in_target_population_Index(i);%The index of the most active target neuron is selected
%Fiding the number of most active distractors
candidate_distractor_population_index= find(max(most_active_neuron_in_disractor_population_rate)==most_active_neuron_in_disractor_population_rate);%find the index of the candidate distracotr population winners
number_of_candidate_distractor_populations = numel(candidate_distractor_population_index); % determines the number of candidate distractor population winners%Finding the number of most active distractor neurons 


if most_active_neuron_in_target_population_rate>max(most_active_neuron_in_disractor_population_rate)%Here the target in the winnrt-correct readout
    correct_readout(actual_round)=1;%a correct readout is added to the sum of correct readouts
    winning_neuron_index=selected_neuron_in_target_population_index;%the index of the winning target neuron is recorded. This will go to scorer chance analysis
end

if most_active_neuron_in_target_population_rate==max(most_active_neuron_in_disractor_population_rate)%Here there is a tie between the most active target and distractor neurons
   thresh_hold=1/(1+number_of_candidate_distractor_populations);

    if thresh_hold>rand(1)%drawing to decide if the target in the winner, based on its chance computed in the last line
     correct_readout(actual_round)=1;%If the target is the winner a correct readout is added to the sum of correct readouts
     winning_neuron_index=selected_neuron_in_target_population_index;%the index of the winning target neuron is recorded. This will go to scorer chance analysis

    else    
    correct_readout(actual_round)=0;
    i = randi(number_of_candidate_distractor_populations); % returns a random integer between 1 and the number of candidate distractors.
    selected_winning_distractor_population_index = candidate_distractor_population_index(i); % The winning distractor population index is the randomly chosen from the candidates
    end
end

if most_active_neuron_in_target_population_rate<max(most_active_neuron_in_disractor_population_rate)%Here the winning neuron is a ditractor-wrong readout
    correct_readout(actual_round)=0;
    candidate_distractor_population_index= find(max(most_active_neuron_in_disractor_population_rate)==most_active_neuron_in_disractor_population_rate);%find the index of the candidate distracotr population winners
    number_of_candidate_distractor_populations = numel(candidate_distractor_population_index); % determines the number of candidate distractor population winners
    i = randi(number_of_candidate_distractor_populations); % returns a random integer between 1 and the number of candidate distractors.
    selected_winning_distractor_population_index = candidate_distractor_population_index(i); % The winning distractor population index is the randomly chosen from the candidates
end
%Here we got to the end of the round, lets save some data
if correct_readout(actual_round)==1
    winning_target_neuron_index_simulation(actual_round)=winning_neuron_index;
    winning_target_neuron_firing_rate_simulation(actual_round)=most_active_neuron_in_target_population_rate;
end

if correct_readout(actual_round)==0
    winning_distractor_population_index_simulation(actual_round)=selected_winning_distractor_population_index;
    winning_distractor_neuron_firing_rate_simulation(actual_round)=max(most_active_neuron_in_disractor_population_rate);
end
end
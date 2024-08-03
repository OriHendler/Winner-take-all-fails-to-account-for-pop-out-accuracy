function[correct_readout,winning_population_index_simulation]= the_competitionPOP(target_neurons_rate_parameters,distractor_neurons_rate_parameters,rounds,bar_location,M,N)

correct_readout=0*ones(1,rounds); %start with zero correct and zero incorrect readouts ofcourse
winning_population_index_simulation=0*ones(1,rounds);
target_firing_rate_this_round=0*ones(M,N);
distractor_firing_rate_this_round=0*ones(M,N);
for actual_round=1:rounds

for population_number=1:M
target_firing_rate_this_round(population_number,:)=poissrnd(target_neurons_rate_parameters(population_number,:)); %gives possion noise to the target neurons
distractor_firing_rate_this_round(population_number,:)=poissrnd(distractor_neurons_rate_parameters(population_number,:)); %gives possion noise to the distractor neurons
end

%Population competition
mean_target_population_rate= mean(target_firing_rate_this_round(bar_location,:),2);%finds the mean rate of the target population
mean_disractor_population_rate= mean(distractor_firing_rate_this_round,2);%finds the mean rate of each distractor population
mean_disractor_population_rate(bar_location)=0;

%Fiding the number of most active distractors
candidate_distractor_population_index= find(max(mean_disractor_population_rate)==mean_disractor_population_rate);%find the index of the candidate distracotr population winners
number_of_candidate_distractor_populations = numel(candidate_distractor_population_index); % determines the number of candidate distractor population winners%Finding the number of most active distractor neurons 


if mean_target_population_rate>max(mean_disractor_population_rate)%Here the target in the winnrt-correct readout
    correct_readout(actual_round)=1;%a correct readout is added to the sum of correct readouts
    winning_population_index=bar_location;%the index of the winning target neuron is recorded. This will go to scorer chance analysis
end

if mean_target_population_rate==max(mean_disractor_population_rate)%Here there is a tie between the most active target and distractor neurons
   thresh_hold=1/(1+number_of_candidate_distractor_populations);

    if thresh_hold>rand(1)%drawing to decide if the target in the winner, based on its chance computed in the last line
     correct_readout(actual_round)=1;%If the target is the winner a correct readout is added to the sum of correct readouts
    winning_population_index=bar_location;%the index of the winning target neuron is recorded. This will go to scorer chance analysis

    else    
    correct_readout(actual_round)=0;
    i = randi(number_of_candidate_distractor_populations); % returns a random integer between 1 and the number of candidate distractors.
    winning_population_index = candidate_distractor_population_index(i); % The winning distractor population index is the randomly chosen from the candidates
    end
end

if mean_target_population_rate<max(mean_disractor_population_rate)%Here the winning population is a ditractor-wrong readout
    correct_readout(actual_round)=0;
    i = randi(number_of_candidate_distractor_populations); % returns a random integer between 1 and the number of candidate distractors.
    winning_population_index = candidate_distractor_population_index(i); % The winning distractor population index is the randomly chosen from the candidates
end

%Here we got to the end of the round, lets save some data
    winning_population_index_simulation(actual_round)=winning_population_index;

end
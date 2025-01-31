%Testing how to add correlations to the network

clear all
close all
wta=1;
Popwta=0;
%
Narr=[ 1000 ]; %number of neurons per population
Marr=[ 3 8 ];  %number of distracotrs
qarr=[1.1 1.2 1.3];
iteration=0; %initial value
for repeated_WTA= [ 1:1:10]
for q=qarr
for N=Narr
trials=1000;

for M=Marr
clear var MEANt MEANd Rd Rt MAXt MAXd MAXMAXd
%Generate networks
for repeated_WTA_idx= 1:repeated_WTA
for Midx=1:M+1
% Define mu and sigma for the underlying normal distribution of log(lambda)
meann = 12.8 ;
variance = 4; 
mu = log((meann^2)/sqrt(variance+meann^2));
sigma = sqrt(log(variance/(meann^2)+1));
% Generate lambda from a lognormal distribution
lambda = lognrnd(mu, sigma, 1, N)/ (5 * repeated_WTA);

% Generate Poisson-distributed data using these lambda values
Rt = poissrnd(repmat(lambda, trials, 1));

q_Hetro=exprnd_shifted(q-1,N,1);

Rd = poissrnd(repmat(lambda./q_Hetro', trials, 1));

%Verify Correlation-Coeffs of generated vectors
% coeffMatrixt=corrcoef(Rt(:,7),Rt(:,85));
% coeffMatrixd=corrcoef(Rt(:,7),Rt(:,85));
Rt_saver{repeated_WTA_idx,Midx}=Rt;
Rd_saver{repeated_WTA_idx,Midx}=Rd;
end
end

if wta
for repeated_WTA_idx= 1:repeated_WTA
%Begin wta computation
bar_location=1;
MAXt=(max(Rt_saver{repeated_WTA_idx, bar_location}'))';
for Didx=2:M+1
MAXd(:,Didx)=(max(Rd_saver{repeated_WTA_idx, Didx}'))';
end
[MAXMAXd idx_strongest_distractor]=max(MAXd,[],2);

idx_strongest_population = idx_strongest_distractor;
idx_strongest_population(MAXt > MAXMAXd) = 1;

% Handle ties
tieIdx = find(MAXt == MAXMAXd);
if ~isempty(tieIdx)
    % Generate a random logical array for the tie trials
    % About half will be true, half false
    randomChoice = rand(size(tieIdx)) > 1-1/(M+1);
    
    % Assign target to about half of the ties
    idx_strongest_population(tieIdx(randomChoice)) = 1;
    % The other half remain distractors as previously set
end

save_idx_strongest_population(:, repeated_WTA_idx) = idx_strongest_population;
end
[rows, ~] = size(save_idx_strongest_population); % Get the number of rows

wins = 0; % Counter for number of times '1' wins

for i = 1:rows
    rowData = save_idx_strongest_population(i,:);

    % Get unique values and their counts
    [uniqueVals, ~, idx] = unique(rowData);
    counts = accumarray(idx, 1);

    % Find the maximum count and which values achieve it
    maxCount = max(counts);
    maxIndices = find(counts == maxCount);
    topValues = uniqueVals(maxIndices);

    if any(topValues == 1) 
        % 1 is among the top scorers
        if length(topValues) == 1
            % 1 is the sole winner
            wins = wins + 1;
        else
            % Tie includes 1 and other numbers: choose randomly
            chosen = datasample(topValues, 1); 
            if chosen == 1
                fprintf('Row %d: 1 wins by tie-break.\n', i);
                wins = wins + 1;
            else
                fprintf('Row %d: Another number (%d) wins by tie-break.\n', i, chosen);
            end
        end
    else
        % 1 is not among the top scorers, thus it loses
        fprintf('Row %d: 1 is the loser.\n', i);
    end
end

% Compute and display the percentage of rows where 1 won
readout_accuracy = (wins / rows);
fprintf('1 won in %.2f%% of the rows.\n', readout_accuracy);
end

if Popwta
%Begin Population-wta computation
bar_location=1;
MEANt=(mean(Rt_saver{1, bar_location}'))';
for Didx=2:M+1
MEANd(:,Didx)=(mean(Rd_saver{1, Didx}'))';
end
POP_readout_accuracy=sum(MEANt>max(MEANd,[],2))/trials;
end
iteration=iteration+1;
if wta
data_saver(iteration,1)=readout_accuracy;
else
data_saver(iteration,1)=700;
end
if Popwta
data_saver(iteration,2)=POP_readout_accuracy;
else
data_saver(iteration,2)=700;
end
data_saver(iteration,3)=M;
data_saver(iteration,4)=N;
data_saver(iteration,5)=q;
data_saver(iteration,6)=repeated_WTA;
end
end
end
end

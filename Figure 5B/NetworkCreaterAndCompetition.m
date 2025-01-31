% Testing how to add correlations to the network

clear all
close all

wta = 1;
Popwta = 1;

correlation_cofarr = [0 0.01 0.05]; % correlation between the firing rate of neurons in the same population 
Narr = [1:1:1000]; % number of neurons per population
Marr = [ 10 ]; % number of distractors
qarr = [1.1 1.2 1.3];
iteration = 0; % initial value
trials = 1000;

% Preallocate memory for results
total_iterations = length(correlation_cofarr) * length(Narr) * length(Marr) * length(qarr);
data_saver = zeros(total_iterations, 6);

for correlation_cof = correlation_cofarr
    for N = Narr

        
        % Generate Correlation Matrix
        Correlation_matrix = correlation_cof * (ones(N) - eye(N)) + eye(N); % Correlation matrix
        U = chol(Correlation_matrix); % Cholesky decomposition 
        
        for q = qarr
            for M = Marr
                % Preallocate memory for intermediate variables
                max_activity_interval = zeros(trials, 2);
                max_activity_interval_POP = zeros(trials, 2);

                % Clear unnecessary variables at the start of each loop
                clearvars Rt Rd Rt_saver Rd_saver MAXt MAXd MEANt MEANd MAXMAXd

                % Generate networks
                for interval = 1:2
                    for Midx = 1:M+1
                        % Generate correlated data
                        R = randn(trials, N); % Random data in N columns
                        Rc_uniform = R * U; % Correlated matrix
                        mu = 12.8 / 5;
                        sigma = sqrt(mu);
                        Rt = mu + sigma * Rc_uniform; % Gaussian correlated matrix
                        q_Hetro = exprnd_shifted(q - 1, N, 1);

                        % Generate distractor population firing rates
                        for idx = 1:length(q_Hetro)
                            Rd(:, idx) = mu / q_Hetro(idx) + sigma / sqrt(q_Hetro(idx)) * Rc_uniform(:, idx);
                        end

                   
                            Rt_saver{1, Midx} = Rt;
                            Rd_saver{1, Midx} = Rd;
    
                    end

                    if wta
                        % Begin WTA computation
                        bar_location = 1;
                        MAXt = (max(Rt_saver{1, bar_location}, [], 2));
                        if interval == 1
                            for Didx = 2:M+1
                                MAXd(:, Didx) = (max(Rd_saver{1, Didx}, [], 2));
                            end
                        end
                        if interval == 2
                            for Didx = 1:M+1
                                MAXd(:, Didx) = (max(Rd_saver{1, Didx}, [], 2));
                            end
                        end
                        MAXMAXd = max(MAXd, [], 2);

                        if interval == 1
                            max_activity_interval(:, interval) = max(MAXt, MAXMAXd);
                        end
                        if interval == 2
                            max_activity_interval(:, interval) = MAXMAXd;
                            readout_accuracy = sum(max_activity_interval(:, 1) > max_activity_interval(:, 2)) / trials;
                        end
                    end

                    if Popwta
                        % Begin Population-WTA computation
                        bar_location = 1;
                        MEANt = (mean(Rt_saver{1, bar_location}, 2));
                        if interval == 1
                            for Didx = 2:M+1
                                MEANd(:, Didx) = (mean(Rd_saver{1, Didx}, 2));
                            end
                        end
                        if interval == 2
                            for Didx = 1:M+1
                                MEANd(:, Didx) = (mean(Rd_saver{1, Didx}, 2));
                            end
                        end
                        if interval == 1
                            max_activity_interval_POP(:, interval) = max(MEANt, max(MEANd, [], 2));
                        end
                        if interval == 2
                            max_activity_interval_POP(:, interval) = max(MEANd, [], 2);
                            POP_readout_accuracy = sum(max_activity_interval_POP(:, 1) > max_activity_interval_POP(:, 2)) / trials;
                        end
                    end
                end

                % Save results
                iteration = iteration + 1;
                data_saver(iteration, 1) = readout_accuracy;
                data_saver(iteration, 2) = POP_readout_accuracy;
                data_saver(iteration, 3) = M;
                data_saver(iteration, 4) = N;
                data_saver(iteration, 5) = q;
                data_saver(iteration, 6) = correlation_cof;

                % Periodically clear memory
                clearvars Rt Rd Rt_saver Rd_saver
            end
        end
    end
end

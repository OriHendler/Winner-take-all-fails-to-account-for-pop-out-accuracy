clear all
close all

% Apply graphic settings
GrphicSettings();

% Define range of parameters
b = 12.8;
epsilon_values = 1./[1:0.1:10];

% Initialize vectors to store results
I_poisson = zeros(size(epsilon_values));
I_gaussian = zeros(size(epsilon_values));
I_exponential = zeros(size(epsilon_values));

% Loop over each value of epsilon_values
for i = 1:length(epsilon_values)
    % Current value of epsilon
    epsilon = epsilon_values(i);
    
    % Calculate mutual information for Poisson distribution
    I_poisson(i) = mutualInformationPoissonResponce(b, epsilon);

    % Calculate mutual information for Gaussian distribution
    I_gaussian(i) = mutualInformationGaussianResponce(b, epsilon);

    % Calculate mutual information for Exponential distribution
    I_exponential(i) = mutualInformationExponentialResponce(epsilon);
end

% Plot the results
figure;

plot(1./epsilon_values, I_poisson, 'DisplayName', 'Poisson','Color','b');
hold on;
plot(1./epsilon_values, I_gaussian, 'DisplayName', 'Gaussian','Color','g');
hold on
plot(1./epsilon_values, I_exponential, 'DisplayName', 'Exponential','Color','r');

xlabel('Contextual Modulation Strength');
ylabel('Mutual Information [bit]');
legend('Location', 'Best');
title('Mutual Information of Response and Stimuli');
box off
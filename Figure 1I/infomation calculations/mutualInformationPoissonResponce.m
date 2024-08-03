function I = mutualInformationPoissonResponce(b, epsilon)
% Define symbolic variable
syms k;



    % Parameters for Poisson distribution 1
    lambda1 = b;

    % Parameters for Poisson distribution 2
    lambda2 = b * epsilon;

    % Define the Poisson PMF
    poisson_pmf = @(k, lambda) exp(-lambda) * (lambda.^k) / factorial(k);
   
    % Sum over k for each PMF*log(PMF)
    sum_term1 = 0;
    sum_term2 = 0;
    for k_val = 0:50  % Adjust the range based on your needs
        pmf1 = poisson_pmf(k_val, lambda1);
        pmf2 = poisson_pmf(k_val, lambda2);

        sum_term1 = sum_term1 + pmf1 * log(pmf1);
        sum_term2 = sum_term2 + pmf2 * log(pmf2);
    end

    % Sum over k
    sum_term = 0;
    for k_val = 0:50  % Adjust the range based on your needs
        sum_term = sum_term + (poisson_pmf(k_val, lambda1) + poisson_pmf(k_val, lambda2)) ...
                                * log(0.5 * poisson_pmf(k_val, lambda1) + 0.5 * poisson_pmf(k_val, lambda2));
    end

    % Calculate the expression I
    I = 0.5 * (sum_term1 + sum_term2 - sum_term)/ log(2);


end

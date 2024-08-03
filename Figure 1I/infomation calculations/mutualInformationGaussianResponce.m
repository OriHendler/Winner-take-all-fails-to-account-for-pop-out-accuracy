function I = mutualInformationGaussianResponce(b, epsilon)

% Define symbolic variable
syms x;


    % Parameters for Gaussian 1
    mu1 = b;
    sigma1 = sqrt(b);

    % Parameters for Gaussian 2
    mu2 = b * epsilon;
    sigma2 = sqrt(b );

    % Define the Gaussian function
    gaussian = @(x, mu, sigma) (1 / (sigma * sqrt(2 * pi))) * exp(-((x - mu).^2) / (2 * sigma^2));

    % Define the integrand using anonymous functions
    expression = @(x) (gaussian(x, mu1, sigma1) + gaussian(x, mu2, sigma2)) ...
                     .* log(0.5 * gaussian(x, mu1, sigma1) + 0.5 * gaussian(x, mu2, sigma2));

    % Perform numerical integration
    numericResult = integral(expression, -40,40);

    % Calculate the expression I
    I = 0.5 * (-1 - log(2 * pi * b ) - numericResult);
    I=I/log(2);



end
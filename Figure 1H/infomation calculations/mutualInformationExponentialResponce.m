function I = mutualInformationExponentialResponce(epsilon)

% Define symbolic variable
syms x;

b=1/epsilon;

    % Define the integrand
    expression = 0.5 * exp(-x) * (1 + (b^2 + 1) * exp((1 - b) * x) + b^2 * exp(2 * (1 - b) * x)) / (1 + b * exp((1 - b) * x));

    % Convert the symbolic expression to a MATLAB function
    integrand = matlabFunction(expression);

    % Perform numerical integration
    numericResult = integral(integrand, 0, Inf);

    % Calculate the expression I
    I = 0.5 * log(b)-1-log(0.5*(1+b)) + numericResult;
    I=I/log(2);


end
% Define the objective function
objectiveFunc = @(params, t) Temp(25, 0.5, 0.0254, params(1), params(2), 0.06985/2, 0.00635/2, 0.00635/2, t);

% Initial guesses for TC and TD
initialGuess = [10, 1e-7];

% Define lower bounds for TC and TD
lb = [0, 0]; % Ensure that TC and TD are positive

% Define upper bounds if needed (optional)
% ub = [upper_TC, upper_TD];

% Create an options structure with bounds
options = optimoptions('lsqnonlin', 'LowerBound', lb); % 'UpperBound', ub);

% Use lsqnonlin with options
fittedParams = lsqnonlin(objectiveFunc, initialGuess, lb, [], options);

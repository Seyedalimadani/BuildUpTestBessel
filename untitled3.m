% Define the objective function
objectiveFunc = @(params, t) Temp(25, 0.5, 0.0254, params(1), params(2), 0.06985/2, 0.00635/2, 0.00635/2, t);

% Initial guesses for TC and TD
initialGuess = [10, 1e-7];

% Define lower bounds for TC and TD
lb = [0, 0]; % Ensure that TC and TD are positive

% Create an anonymous function to enforce bounds
constrainedObjectiveFunc = @(params) objectiveFunc(params, Model) - NeedleSensitivitymph;
lbcon = initialGuess - lb; % Lower bound constraint
ubcon = []; % No upper bound constraint

% Use lsqnonlin with bounds
fittedParams = lsqnonlin(constrainedObjectiveFunc, initialGuess, lbcon, ubcon);

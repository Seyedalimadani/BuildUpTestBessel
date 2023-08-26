% Define the objective function
objectiveFunc = @(params, t) Temp(25, 0.5, 0.0254, params(1), params(2), 0.06985/2, 0.00635/2, 0.00635/2, t);

% Initial guesses for TC and TD
initialGuess = [10, 1e-7];

% Use lsqcurvefit to perform the fitting
fittedParams = lsqcurvefit(objectiveFunc, initialGuess, Model, NeedleSensitivitymph);

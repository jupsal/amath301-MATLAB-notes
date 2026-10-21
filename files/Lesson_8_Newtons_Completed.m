close; clear; clc

% We will work with the function f(x) = 2x + cos(x)
f = @(x) 2*x + cos(x);

% We also need the derivative. We calculate by hand.
fp = @(x) 2 - sin(x);

% We need to choose a starting guess.
xstar = 0; 

% We need to choose a tolerance
tol = 1e-12;

% We need to choose a maximum number of iterations
max_iter = 100;

% Now iterate
for j = 1:max_iter
    % Check to see if xstar is a root
    if abs(f(xstar))<tol
        root = xstar;
        disp("Root found at " + xstar + " in " + j + " iterations")
        break % exits the loop
    else
        xstar = xstar - f(xstar)/fp(xstar); % Newton formula
    end

    if j == max_iter
        disp("Max iterations reached. Algorithm did not converge.")
    end
end

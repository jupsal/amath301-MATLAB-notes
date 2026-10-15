close all; clear; clc;

% Define parameters
a = -2; b = 3; tol = 1e-12;
max_iter = 1000; % Maximum number of iterations in for loop

% Iterate max_iter times: which control structure do we use?

for j = 1:max_iter
    xstar = (a+b)/2; % Calculate xstar, the mid point of [a, b]
    
    % Check: Is f(xstar) = 0? If so, we are at the root.
    %                         If not, need to move boundaries.
    if abs(2*xstar + cos(xstar))<tol     % TASK 1: Fill in
        root = xstar; 
        disp("The root was found at xstar = " + xstar)
        break                       % <- Task 4. "break" exits the loop
    elseif (2*xstar + cos(xstar))*(2*a + cos(a))>0 % TASK 2: Check if we need to change boundary
        % This is checking "is f(xstar)*f(a)>0?
        % If product is positive, both have same sign. Move left boundary.
        a = xstar;           % Move left boundary
    else
        b = xstar;           % Move right boundary
    end

    if j==max_iter        % <- TASK 3: check if we have reached max_iter
        % This means we have reached the max number of iterations.
        % The algorithm is NOT converging
        disp("Max iterations reached; algorithm did not converge")
    end
end
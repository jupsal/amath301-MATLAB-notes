close all; clear; clc;

% Define parameters
a = -2; b = 3; tol = 1e-12;
max_iter = 1000; % Maximum number of iterations in for loop

% Iterate max_iter times: which control structure do we use?

%{
% Uncomment this all once you've setup the appropriate control structure
    xstar = (a+b)/2; % Calculate xstar, the mid point of [a, b]
    
    % Check: Is f(xstar) = 0? If so, we are at the root.
    %                         If not, need to move boundaries.
    if                      % TASK 1: Fill in
        root = xstar; 
        disp("The root was found at xstar = " + xstar)
    elseif                  % TASK 2: Check if we need to change boundary
        a = xstar           % Move left boundary
    else
        b = xstar           % Move right boundary
    end

                            % <- TASK 3: check if we have reached max_iter
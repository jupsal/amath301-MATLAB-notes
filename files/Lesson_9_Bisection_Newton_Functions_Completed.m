close all; clear; clc

%% Define the functions
% Bisection function
function [root, iterations] = bisection(f, a, b, tol, max_iter)

    %{ 
        bisection uses the Bisection Method to find a root of the function
        f(x) on the interval [a,b].
        Inputs: 
            - f: an anonymous function handle
            - a: the left endpoint of the search interval
            - b: the right endpoint of the search interval
            - tol: the tolerance for the tolerance check
            - max_iter: the maximum number of iterations this algorithm
                        will run before exiting.
        Outputs:
            - root: the root of f(x) on [a,b]
            - iterations: the number of iterations required to find the root
         
    %}

    % First, a robustness check: are f(a) and f(b) the same sign? If so, this won't work.
    if f(a)*f(b)>0
        disp("f(a) and f(b) have the same sign. IVT does not guarantee a root in (a,b). Try changing a and b.")
        root = []; %"null"
        return % this exits the function right here
    end

    for j = 1:max_iter
        xstar = (a+b)/2; % Calculate xstar, the mid point of [a, b]
        
        % Check: Is f(xstar) = 0? If so, we are at the root.
        %                         If not, need to move boundaries.
        if abs(f(xstar))<tol     
            root = xstar; 
            disp("The root was found at xstar = " + xstar)
            break                       % <- Task 4. "break" exits the loop
        elseif f(xstar)*f(a)>0 
            % This is checking "is f(xstar)*f(a)>0?
            % If product is positive, both have same sign. Move left boundary.
            a = xstar;           % Move left boundary
        else
            b = xstar;           % Move right boundary
        end
    
        if j==max_iter        
            % This means we have reached the max number of iterations.
            % The algorithm is NOT converging
            disp("Max iterations reached; algorithm did not converge")
            root = []; % Set root to empty array, meaning no root found.
        end
    end
    iterations = j;
end


% Newton's method function
function [root, iterations] = newton(f, fp, x0, tol, max_iter)

    %{ 
        newton uses Newton's Method to find a root of the function
        f(x) with the initial guess x0.
        Inputs: 
            - f: an anonymous function handle, f(x)
            - fp: an anonymous function handle for the derivative, f'(x)
            - x0: the initial guess for the root
            - tol: the tolerance for the tolerance check
            - max_iter: the maximum number of iterations this algorithm
                        will run before exiting.
        Outputs:
            - root: the root of f(x) on [a,b]
            - iterations: the number of iterations required to find the root        
    %}
    xstar = x0; % Start off with xstar = x0 % DON'T INCLUDE THIS INITIALLY, SHOW ERROR
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
            root = []; % Set root to empty array, meaning no root found.
        end
    end
    iterations = j; % save iterations for output
end

%% Test for various choices

f = @(x) 2*x + cos(x);
% First, plot
x = linspace(-3, 3, 1000);
figure()
plot(x, f(x), 'LineWidth', 3)
hold on
plot(x, 0*x, 'LineWidth', 2, 'Color', 'k')

% Bisection
[bisection_root, bisection_iter] = bisection(f, -2, 3, 1e-12, 2000);

% Newton's
fp = @(x) 2 - sin(x);
[newton_root, newton_iter] = newton(f, fp, 0, 1e-12, 2000);
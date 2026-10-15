close all; clear; clc;

% Define the function below 

function root = bisection(f, a, b, tol)

    % First, a robustness check: are f(a) and f(b) the same sign? If so, this won't work.
    if f(a)*f(b)>0
        disp("f(a) and f(b) have the same sign. IVT does not guarantee a root in (a,b). Try changing a and b.")
        root = []; %"null"
        return % this exits the function right here
    end
    
    % We need to begin by creating xstar for the while loop
    xstar = (a+b)/2;
    
    while abs(f(xstar))>=tol % Do this WHILE f(xstar) is big.   
        if f(xstar)*f(a)>0
            a = xstar;
        else
            b = xstar;
        end
        xstar = (a+b)/2; % Recalculate xstar
    end
    root = xstar; % while loop exited once we've found root
    disp("The root was found at xstar = " + xstar)
end

% Now use the function
f = @(x) 2*x + cos(x);
root = bisection(f, 0, 3, 1e-12);
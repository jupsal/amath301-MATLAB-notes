clear; close all; clc;

%% Quadratic formula implementation: can you spot what's slightly wrong?
% Define values for a, b, c: ax^2 + bx + c = 0
a = 1
b = sqrt(2)
c = 1/2

d = b^2 - 4*a*c
%{
% This implementation has something wrong.
if d > 0
    disp("There are two real roots")
    x1 = (-b - sqrt(d)) / (2*a);
    x2 = (-b + sqrt(d)) / (2*a);
    roots = [x1, x2]; % Create an array of the roots
    disp(roots)
elseif d == 0
    disp("There is one real root")
    x = -b/(2*a);
    roots = [x]; % Save the result as an array
    disp(roots)
else
    disp("There are no real roots")
    roots = []; % Create an empty array
end
%}
% The problem with the implementation above is that we are checking d==0
% exactly. We know that this won't work with rounding errors. Instead, use
% a tolerance check. 

%% Correct implementation, with tolerance check
tol = 1e-12; % I chose this randomly. It's a good value for a tolerance check

% Need to start with tolerance check
if abs(d)<tol % Checking: |d-0|<tol
    disp("There is one real root")
    x = -b/(2*a);
    roots = [x]; % Save the result as an array
    disp(roots)
elseif d>= tol
    disp("There are two real roots")
    x1 = (-b - sqrt(d)) / (2*a);
    x2 = (-b + sqrt(d)) / (2*a);
    roots = [x1, x2]; % Create an array of the roots
    disp(roots)
else
    disp("There are no real roots")
    roots = []; % Create an empty array
end
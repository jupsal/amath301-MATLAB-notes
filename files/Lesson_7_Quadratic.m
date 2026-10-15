clear; close all; clc;

%% Quadratic formula implementation: can you spot what's slightly wrong?
% Define values for a, b, c: ax^2 + bx + c = 0
a = 1
b = 2
c = 3

d = b^2 - 4*a*c

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

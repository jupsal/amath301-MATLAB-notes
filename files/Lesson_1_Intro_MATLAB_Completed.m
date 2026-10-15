clc; clear
%% Exercise 1 – Practice with mathematical functions
% Starter code is below
A1 = sqrt(23); 
A2 = sqrt(pi + sqrt(23 + 2^2)); 
A3 = abs(93 - exp(5)); 
A4 = tan(pi/4);

% disp(A5 + 7)

%% Exercise 2 – Engineering a pipe
% Starter code is below
% Display a message
disp("We will calculate geometric quantities for a pipe.");

% Start with defining radius
r = 3.04578;

% I want to display the sentence:
%  "With a pipe of radius 3.04578..."
disp("With a pipe of radius " + r + " we will compute Area, Circumference, and Volume")
area = pi*r^2;
circ = 2*pi*r;
vol = 12*area;

msg = "The volume of water in 1 foot of pipe is " + vol;
disp(msg)
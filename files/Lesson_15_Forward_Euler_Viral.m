close all; clear; clc;

%% Setup Parameters
p = 2.5;      % replication rate (1/day)
c = 0.5;      % clearance rate (1/day)
k = 0.26;     % immune killing rate
I_max = 10;   % maximum immune response
beta = 0.2;   % immune ramp-up rate (1/day)
T = 30;		  % The final time
dt = 0.1;	  % Step size

%% Setup immune response function


% First setup the solver without a function
% We will comment this out once we create the function for Forward Euler.

    
% Plot this to verify solution. 
%{
fig = figure();
plot(t, V, 'linewidth', 3)
xlabel('Time (days)', 'fontsize', 16)
ylabel('Viral Load (particles/mL)', 'fontsize', 16)
title('Viral Load During Infection (Forward Euler)', 'fontsize', 18)
grid()
exportgraphics(fig, "Viral-Forward1.png")
%}

%% Create a function for forward Euler; check that it creates the same figure


%% Optional tasks below
% Create a plotting function so we can check these different parameter choices

% Weaker immune response, chronic infection
t = 0:dt:60;


% Fast immune response, beta = 0.8
t = 0:dt:T; 

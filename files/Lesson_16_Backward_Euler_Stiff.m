close all; clear; clc;

%% Setup ODE function
dxdt = @(x) -15*x;
T = 1;

% Setup figure
fig = figure();
xlabel('t')
ylabel('x(t)')
title("Solving $x'(t) = -15x(t)$ with backward Euler", "Interpreter", "latex")
% Solve for 0<=t<=1, with dt = 0.2
dt = 0.2;

% Backward Euler below


% Plotting stuff below. Uncomment to make the plot
%{ 
label = "dt = " + dt; % Create label for the plot
plot(t, x, 'linewidth', 3, 'marker', 'o', 'DisplayName', label);
% Add a legend
legend('Fontsize', 24)
ylim([-8, 8])
% Resize everything
set(gca, 'fontsize', 24)
%}
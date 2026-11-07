close all; clear; clc;

%% Setup ODE function
dxdt = @(x) -15*x;
T = 1;

% Setup figure
fig = figure();
hold on
xlabel('t')
ylabel('x(t)')
title("Solving $x'(t) = -15x(t)$ with forward Euler", "Interpreter", "latex")
% Solve using various dt values
dt_vals = [0.05, 0.1, 0.2];
markers = ['o', 's', 'd'];
for j = 1:length(markers)
    dt = dt_vals(j);
    t = 0:dt:T;

    % Forward Euler 
    x = zeros(1, length(t)); % Setup array x
    x(1) = 1.2;              % Define initial condition
    
    % Loop
    for i = 1:length(t) - 1
        x(i+1) = x(i) + dt*dxdt(x(i));
    end

    % Plot solution 
    label = "dt = " + dt;
    plot(t, x, 'linewidth', 3, 'marker', markers(j), 'DisplayName', label);
end

% Add a legend
legend('Fontsize', 24)
ylim([-8, 8])
% Resize everything
set(gca, 'fontsize', 24)
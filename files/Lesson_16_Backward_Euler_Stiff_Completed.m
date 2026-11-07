close all; clear; clc;

%% Setup ODE function
dxdt = @(x) -15*x;
T = 1;

% Setup figure
fig = figure();
hold on
xlabel('t')
ylabel('x(t)')
title("Solving $x'(t) = -15x(t)$ with backward Euler", "Interpreter", "latex")
% solve with dt = 0.2
dt = 0.2;
t = 0:dt:T;
x = zeros(1, length(t));
x(1) = 1.2;
for i = 1:length(t) - 1
    x(i+1) = x(i) / (1 + 15*dt);
end

label = "dt = " + dt;
plot(t, x, 'linewidth', 3, 'marker', 'o', 'DisplayName', label);


% Add a legend
legend('Fontsize', 24)
ylim([-8, 8])
% Resize everything
set(gca, 'fontsize', 24)
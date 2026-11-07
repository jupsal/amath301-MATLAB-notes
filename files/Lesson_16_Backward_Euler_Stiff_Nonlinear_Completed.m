close all; clear; clc;

%% Setup ODE function
dxdt = @(t, x) (5e5)*(-sin(x) + sin(t));;
T = 6;

% Setup figure
fig = figure();
xlabel('t')
ylabel('x(t)')
title("Solving nonlinear ODE", "Interpreter", "latex")
% Solve for 0<=t<=6, with dt = 0.1
dt = 0.1;
t = 0:dt:T;

% First try forward Euler
x = zeros(1, length(t));
x(1) = 0;
for i = 1:length(t)-1
    x(i+1) = x(i) + dt*dxdt(t(i), x(i));
end
plot(t, x, 'linewidth', 3, 'displayname', 'Forward Euler')
hold on

% Now backward Euler
x = zeros(1, length(t));
x(1) = 0;
for i = 1:length(t) - 1
    eqn = @(z) z - x(i) - dt*dxdt(t(i+1), z);
    x(i+1) = fzero(eqn, x(i));
end
plot(t, x, 'linewidth', 3, 'displayname', 'Backward Euler')
% Plotting stuff below. Uncomment to make the plot 
label = "dt = " + dt; % Create label for the plot
plot(t, x, 'linewidth', 3, 'marker', 'o', 'DisplayName', label);
% Add a legend
legend('Fontsize', 24)
ylim([-8, 8])
% Resize everything
set(gca, 'fontsize', 24)

% compare to "exact" solution 
[t, y] = ode45(dxdt, [0, T], 0);
plot(t, y, 'linewidth', 3, 'displayname', 'Exact')

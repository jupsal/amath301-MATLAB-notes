close all; clear; clc;

% In this script we solve the BZ Reaction System of IVPs:

% Set linewidth to 3 for all plots we make in this script
set(groot, 'DefaultLineLineWidth', 3); 

%% Task 1: Create a function ode
s = 7.27; w = 1.61; q = 1e-3;
ode_y = @(y1, y2, y3) [s*(y2 - y1*y2 + y1 - q*y1.^2);
                       1/s * (-y2 - y1*y2 + y3);
                       w*(y1 - y3)];

ode = @(t, y) ode_y(y(1), y(2), y(3));

%% Task 2: Solve the IVP with ode45
IC = [1, 2, 3]; % = [y1(0), y2(0), y3(0)];

[t, y] = ode45(ode, [0, 30], IC);

%% Task 3: extract and plot
y1 = y(:, 1); 
y2 = y(:, 2); 
y3 = y(:, 3);

figure
plot(t, y1, 'DisplayName', '$y_1(t)$ - Bromous Acid')
hold on
plot(t, y2, 'DisplayName', '$y_2(t)$ - Bromide')
plot(t, y3, 'DisplayName', '$y_3(t)$ - Cerium')
title("BZ Reaction")
xlabel("Time (seconds)")
ylabel("Relative concentrations")
legend("Interpreter", "Latex")
set(gca, 'fontsize', 18) %gca = "get current axis". This makes everything fontsize 18
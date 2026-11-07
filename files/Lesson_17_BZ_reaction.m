close all; clear; clc;

% In this script we solve the BZ Reaction System of IVPs:

% Set linewidth to 3 for all plots we make in this script
set(groot, 'DefaultLineLineWidth', 3); 

%% Task 1: Create a function ode


%% Task 2: Solve the IVP with ode45


%% Task 3: extract and plot


% Plotting setup for you below
%{
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
%}
close all; clear; clc;

%% Setup ODE function

T = 6; % solve for 0<=t<=6

%% Task 1: First try forward Euler


% Plot is setup for you below
%{
plot(t, y, 'linewidth', 3, 'displayname', 'Forward Euler')
hold on
legend('Fontsize', 24)
ylim([-8, 8])
% Resize everything
set(gca, 'fontsize', 24)
%}


%% Task 2-3 Now backward Euler

% Plot setup for you below
%{
plot(t, y, 'linewidth', 3, 'displayname', 'Backward Euler')
% Add a legend
legend('Fontsize', 24)
%}

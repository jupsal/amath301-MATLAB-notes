close all; clear; clc;

% In this script we solve the Lotka-Volterra System of IVPs:
%{
   x'(t) = 2x - xy,           x(0) = 6
   y'(t) = -0.5y + 0.2xy,     y(0) = 2

x(t) represents rabbits and y(t) represents foxes.
We will solve this using ode45.
%}

% Set linewidth to 3 for all plots we make in this script
set(groot, 'DefaultLineLineWidth', 3); 

%% Step 0: define tspan
tspan = [0, 15]; % solve for 0<=t<=15

%% Step 1: Package two initial conditions


%% Step 2: Package two ODEs into one anonymous function
% ode_xy = @(x, y)              % <- Fill in

% Alternatively, you can split this part up into two steps if that feels
% better for you. You don't need to do this, but you can, they do the same
% thing!
% xprime = @(x, y) 
% yprime = @(x, y) 
% ode_xy = @(x, y) 

%% Step 3: Package dependent variables to pass to ode45
% The big difficulty here is that we need to *implicitly* define a new
% array z = [x, y]. We don't explicitly put this anywhere, we need to know
% it's the case. One way we can think about this is that we have already
% kind of done this in Task 1: we set z(0) = [x(0), y(0)]

% odefun = @(t, z)              % <- Fill in


% One additional (annoying!) step we need to do here is to convert our ODE
% into a "column vector". Right now we have [dxdt, dydt]. MATLAB wants:
% [dxdt
%  dydt]
% We can do this using ' in our odefun, or we can use [dxdt; dydt] when we
% define ode_xy.



%% Step 4: Input everything and solve with ode45


%% Step 5: extract and plot

%{
figure
plot(t, x, 'DisplayName', 'x(t) - rabbits')
hold on
plot(t, y, 'DisplayName', 'y(t) - foxes')
title("Rabbit and fox populations; Lotka-Volterra model")
xlabel("Time (years)")
ylabel("Populations (thousands)")
legend
set(gca, 'fontsize', 18) %gca = "get current axis". This makes everything fontsize 18
%}


%% Step 6: make ode45 use a higher resolution
% We can ask MATLAB to find the solution on a finer grid by passing a
% fine grid in for tspan instead of the interval. *ode45 still uses its own
% step size, but it _interpolates_ to find the solution on the finer grid.*

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
I = @(t) I_max * (1 - exp(-beta * t));
dVdt = @(t, V) p*V - c*V - k*V.*I(t);

% First setup the solver without a function
% We will comment this out once we create the function for Forward Euler.
t = 0:dt:T; 
V = zeros(1, length(t));
V(1) = 100;

for i = 1:length(t) - 1
    V(i+1) = V(i) + dt*dVdt(t(i),V(i));
end
    
% Plot this to verify solution. 
fig = figure();
plot(t, V, 'linewidth', 3)
xlabel('Time (days)', 'fontsize', 16)
ylabel('Viral Load (particles/mL)', 'fontsize', 16)
title('Viral Load During Infection (Forward Euler)', 'fontsize', 18)
grid()
exportgraphics(fig, "Viral-Forward1.png")
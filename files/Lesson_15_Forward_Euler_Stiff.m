
%% Setup ODE function
dxdt = @(x) -15*x;

% First setup the solver without a function
% We will comment this out once we create the function for Forward Euler.
T = 1;
dt = 0.2;
t = 0:dt:T; 
x = zeros(1, length(t));
x(1) = 1.2;

for i = 1:length(t) - 1
    x(i+1) = x(i) + dt*dxdt(x(i));
end
    
% Plot this to verify solution. 
%fig = figure();
plot(t, x, 'linewidth', 3, 'marker', 'o')
xlabel('Time (t)', 'fontsize', 16)
ylabel('x(t)', 'fontsize', 16)
title('Forward Euler, stiff ODE', 'fontsize', 18)
hold on
grid()
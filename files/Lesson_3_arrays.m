clear; clc; % Clear variables; clear command window

%% Exercise 1: Comparing projectile motion for different launch conditions
% See Ed or MATLAB Grader for problem statement. 
% Starter script below
v0 = [100, 200, 15, 25.9];  % Array of initial velocities

% Define array for launch angle and force of gravity


% Compute t_flight using given formula

% Compute h_max using given formula

% Compute x_range using given formula


%% Exercise 2: Changing conditions
% Start with the code above. 

% First, display the flight time for each launch except launch D


% Now change the arrays and recalculate


% Change the launch angle for each moon launch, these are the last 2 launches
% Make sure to convert 5 degrees to radians!


% Recalculate flight time, maximum height, and range after changing conditions
t_flight = 2*v0.*sin(theta)./g;
h_max = (v0.*sin(theta)).^2./(2*g);
x_range = v0.*cos(theta).*t_flight;
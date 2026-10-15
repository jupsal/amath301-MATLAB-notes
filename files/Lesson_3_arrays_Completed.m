clear; clc; % Clear variables; clear command window

%% Exercise 1: Comparing projectile motion for different launch conditions
% See Ed or MATLAB Grader for problem statement. 
% Starter script below
v0 = [100, 200, 15, 25.9];  % Array of initial velocities

% Define array for launch angle and force of gravity
theta = [75, 85, 30, 40]*pi/180;      % launch angles, converted to radians
g = [9.81, 9.81, 1.63, 1.63];         % gravity constant

% Compute t_flight using given formula
% Because we can do arithmetic with arrays, we can implement the formulae with one step
t_flight = 2*v0.*sin(theta)./g;      % Note the array arithmetic

% Compute h_max using given formula
h_max = (v0.*sin(theta)).^2./(2*g);

% Compute x_range using given formula
x_range = v0.*cos(theta).*t_flight;


% Optional (extra) task 1:
[m, I] = max(x_range);
max_dist_launch_num = I;

% Optional (extra) task 2:
conditions = [v0; theta; g]; % Each row corresponds to v0, theta, g respectively
% This does not match the table, so let's transpose it.
conditions = conditions.'; % Transpose
% Now conditions(:, 1) = v0. Read this as "all rows, first columns"
%     conditions(:, 2) = theta. "All rows, first column"
%     conditions(:, 3) = g. 

t_flight = 2*conditions(:, 1).*sin(conditions(:, 2))./conditions(:, 3);
h_max = (conditions(:, 1).*sin(conditions(:, 2))).^2./(2*conditions(:, 3));
x_range = conditions(:, 1).*cos(conditions(:, 2)).*t_flight.'; % Transpose t_flight


%% Exercise 2: Changing conditions
% Start with the code above. 

% First, display the flight time for each launch except launch D
disp("Flight time for launches A through C:");
disp(t_flight(1:3));

% Now change the arrays and recalculate
v0(2) = v0(2) - v0(2)*0.6; % 60% decrease for launch B only.
                           % We only need to change that one part of v0

% Change the launch angle for each moon launch, these are the last 2 launches
% Make sure to convert 5 degrees to radians!
theta(end-1:end) = theta(end-1:end) + 5*pi/180; 

% Recalculate flight time, maximum height, and range after changing conditions
t_flight = 2*v0.*sin(theta)./g;
h_max = (v0.*sin(theta)).^2./(2*g);
x_range = v0.*cos(theta).*t_flight;
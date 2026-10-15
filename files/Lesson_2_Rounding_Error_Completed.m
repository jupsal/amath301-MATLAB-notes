clear; clc

%% Part 1: Simple tolerance check
% Starter code is below
variable_1 = sqrt(3^2);
variable_2 = sqrt(3)^2;

% Task 1: Calculate and display |a-b| where a and b are the two variables
disp(abs(variable_1 - variable_2))

% Task 2: Choose a value of tolerance so that the two variables are 
%         recorded as "close enough."
tolerance = 1e-12;%   <- Define the variable "tolerance" here.
% Check:
disp("First tolerance check with tolerance = " + tolerance);

result = abs(variable_1 - variable_2) < tolerance; % Can save result as variable

disp("Are the two variables within tolerance? " + result)

% Task 3: Choose a value of tolerance so that the two variables are 
%         recorded as NOT "close enough." 
tolerance = 1e-17;
disp("Second tolerance check with tolerance = " + tolerance);

result = abs(variable_1 - variable_2) < tolerance ;% Can save result as variable

disp("Are the two variables within tolerance? " + result)

%% Part 2: Connecting to experiment (optional)
T_accepted = 100.0;
tolerance = 0.5;

sensor_A = 100.3;
sensor_B = 99.4;
sensor_C = 100.8;

% Write code to check to see whether each sensor is within tolerance. 
disp("Sensor A within tolerance? " + (abs(sensor_A - T_accepted)<tolerance));
disp("Sensor B within tolerance? " + (abs(sensor_B - T_accepted) < tolerance));
disp("Sensor C within tolerance? " + (abs(sensor_C - T_accepted) < tolerance));
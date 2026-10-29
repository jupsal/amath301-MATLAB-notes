close all; clear; clc;

% Our goal here is to compare the order of accuracy for forward, backward,
% and center difference approximations for the derivative of a function.

% We will create figures that demonstrate this.

%% Step 0: setup
f = @(x) sin(2*x) + 3;     % Create f
xstar = 2;                 % The point at which we calculate the secant line

exact = 2*cos(2*xstar);

%% Step 1: Setup Array of h = delta x values
%h = [10^(-1), 10^(-2), ....]; 
h_arr = 10.^(linspace(-1, -4, 4)); % array of h values 

%% Step 2: Setup error array for each method
for_err = zeros(1, length(h_arr)); % Error for forward diff
back_err = 0*h_arr;  % back diff 
center_err = 0*h_arr; % Center diff

%% Step 3: Loop over and calculate the error for the derivative approximation
for i = 1:length(h_arr) % looping over the h values 
    h = h_arr(i);
    forward_diff = (f(xstar + h) - f(xstar))/h;
    for_err(i) = abs(forward_diff - exact);

    backward_diff = (f(xstar) - f(xstar - h))/h;
    back_err(i) = abs(backward_diff - exact);

    center_diff = (f(xstar + h) - f(xstar - h))/(2*h);
    center_err(i) = abs(center_diff - exact);

end

%% Step 4: Create figure
set(groot, 'DefaultLineLineWidth', 3) % Set default line width to 3

% Setup figure
fig1 = figure(1);
xlabel('$\Delta x$', "Interpreter", "Latex") % Label x axis
ylabel("Error")
title("Error for 3 finite difference schemes")

% Plot forward error. Uncomment both lines. Fill in X, Y. 
loglog(h_arr, for_err, 'Marker', 'o', 'DisplayName', 'Forward Error', ...
            'MarkerSize', 14)s

hold on


% Plot backward error. Uncomment both lines. Fill in X, Y.
loglog(h_arr, back_err, 'Marker', 'x', 'DisplayName', 'Backward Error', ...
    'MarkerSize', 14)

% Plot center error. Uncomment both lines. Fill in X, Y.
loglog(h_arr, center_err, 'Marker', 'd', 'DisplayName', 'Center Error', ...
    'MarkerSize', 14)

legend('location', 'northwest'); % Create the legend in the top left.
set(gca, 'FontSize', 24); % Set the font size to 24 for the whole axis

exportgraphics(fig1, "FiniteDifferenceErrorPlots.png")
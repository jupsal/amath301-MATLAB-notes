close all; clear; clc;

% Our goal here is to compare the order of accuracy for forward, backward,
% and center difference approximations for the derivative of a function.

% We will create figures that demonstrate this.

f = @(x) sin(2*x) + 3;     % Create f
xstar = 2;                 % The point at which we calculate the secant line

exact = 2*cos(2*xstar);

% Array of h = delta x values
h_arr = 10.^linspace(-4, -1, 4);

% Setup error array for each method
for_err = zeros(1, length(h_arr));
back_err = zeros(1, length(h_arr));
center_err = zeros(1, length(h_arr));

% Loop over and calculate the error for the derivative approximation
for i = 1:length(h_arr)
    h = h_arr(i);
    
    % Forward difference first
    for_approx = (f(xstar + h) - f(xstar))/h; 
    for_err(i) = abs(for_approx - exact);

    % Backward difference next
    back_approx = (f(xstar) - f(xstar - h))/h; 
    back_err(i) = abs(back_approx - exact);

    % Center difference last
    center_approx = (f(xstar + h) - f(xstar - h))/(2*h); 
    center_err(i) = abs(center_approx - exact);
end

%% Step 1: Create loglog plot
set(groot, 'DefaultLineLineWidth', 3) % Set default line width to 3

% Setup figure
fig2 = figure(2);
title("Error for 3 finite difference schemes, loglog")

% Plot forward error. Change it to loglog 
plot(h_arr, for_err, 'Marker', 'o', 'DisplayName', 'Forward Error', ...
            'MarkerSize', 14)

hold on

% Plot backward error. Change it to loglog
plot(h_arr, back_err, 'Marker', 'x', 'DisplayName', 'Backward Error', ...
    'MarkerSize', 14)

% Plot center error. Change it to loglog
plot(h_arr, center_err, 'Marker', 'd', 'DisplayName', 'Center Error', ...
    'MarkerSize', 14)

legend('location', 'northwest');
set(gca, 'FontSize', 24); % Set the font size to 24 for the whole axis

%% Step 2: Add trendlines



% Label and save figure
xlabel('$\Delta x$', "Interpreter", "Latex") % label x axis
ylabel("Error")
% Save figure
exportgraphics(fig2, 'FiniteDifferenceErrorloglog.png')
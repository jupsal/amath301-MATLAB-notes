close all; clear; clc;

% Practice working with the Bessel Function
disp("besselj(0, 3) = " + besselj(0, 3))

% Task 1: Create J0 function
J0 = @(x) besselj(0, x);

% Task 2: Plot it
fig = figure(1);
x_plot = linspace(0, 20, 100);
subplot(2, 1, 1)
plot(x_plot, J0(x_plot), "LineWidth", 3)
ylabel("$J_0(x)$", "Interpreter", "Latex")
grid on
set(gca, 'FontSize', 20)

% Task 3: Calculate J_0'(1) with the first-order forward difference formula
h = 0.02; % step size
J0prime1 = (J0(1 + h) - J0(1))/h;

% Task 4: Same with backward difference at x=5
h = 0.004;
J0prime5 = (J0(5) - J0(5 - h))/h;

% Task 5: Same with centered difference at x=10
h = 0.5;
J0prime10 = (J0(10 + h) - J0(10-h))/(2*h);

% Task 6: Loop it to get derivative at 100 equally spaced points in [0, 20]
% We already have x_plot defined
h = (x_plot(2) - x_plot(1)); % delta x
J0_forward = x_plot*0; % Initialize it to zeros
for j = 1:length(x_plot)
    J0_forward(j) = (J0(x_plot(j) + h) - J0(x_plot(j)))/h;
end

% Plot it
subplot(2, 1, 2)
plot(x_plot, J0_forward, 'LineWidth', 3, 'DisplayName', ...
            "For diff, for loop")
ylabel("$J_0'(x)$", "Interpreter", "Latex")
hold on
grid on
set(gca, 'FontSize', 20)
legend('Location', "Southeast")

% Task 7: Repeat with array arithmetic
J0_forward2 = (J0(x_plot + h) - J0(x_plot))/h;
plot(x_plot, J0_forward2, 'LineWidth', 2, "LineStyle", ':', ...
        "DisplayName", "For diff, array arithmetic", "color", "black")

% Task 8: backward diff
J0_back = (J0(x_plot) - J0(x_plot - h))/h;
plot(x_plot, J0_back, 'LineWidth', 2, "DisplayName", "Back diff")

% Task 9: Centered diff
J0_center = (J0(x_plot + h) - J0(x_plot - h))/(2*h);
plot(x_plot, J0_center, 'LineWidth', 2, "DisplayName", "Center Diff")

%% Optional problems
J0_accurate = (J0(x_plot - 2*h) - 8*J0(x_plot - h) + 8*J0(x_plot + h) - J0(x_plot))/(12*h);


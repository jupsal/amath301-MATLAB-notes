clear; clc;
close all; % This is a new one! It closes all open figures. close all
           % is especially important because it's easy to edit the wrong
           % figure

%% Exercise 1 – Create 1 figure with 3 line plots on one axis. Use legends.
% Task 0: create a new figure
fig1 = figure(1); 

% Task 1: Discretize the function 1 + sin(2*pi*t) for 0<=t<=2 using 8 points
% Start with discretizing the interval [0, 2]
N1 = 8;
t1 = linspace(0, 2, N1); % An array discretizing [0, 2] with 8 points.
% Then discretize the function
y1 = 1 + sin(2*pi*t1);

% Task 2: Repeat task 1 using 20 points in the discretization
N2 = 20;
t2 = linspace(0, 2, N2);
y2 = 1 + sin(2*pi*t2);

% Task 3: Repeat task 1 using 100 points
N3 = 100;
t3 = linspace(0, 2, N3);
y3 = 1 + sin(2*pi*t3);

% Beautify your figure!
name1 = "N = " + N1;
name2 = "N = " + N2;
name3 = "N = " + N3;
plot(t1, y1, "Color", "b", "LineStyle", "--", "Marker", "o", ...
    "LineWidth", 2, "DisplayName", name1)
% ^ Note that ... just allows us to move to the next line. It's only for
% style. 

hold on % This tells MATLAB to keep what we've already drawn on the figure. 
        % We will be drawing more on the same figure.

plot(t2, y2, "Color", "r", "LineStyle", ":", "Marker", "s", ...
    "LineWidth", 2, "DisplayName", name2)
plot(t3, y3, "Color", "k", "LineWidth", 2, "DisplayName", name3)

% Axis Decorations
xlabel("t (milliseconds)", "FontSize", 16)
ylabel("1 + sin(2\pi t)", "FontSize", 16)
title("1 + sin(2\pi t) for three discretizations", "FontSize", 20)
legend("FontSize", 18)
ylim([-0.25, 2.25])
grid on


% Final thing: save the figure! We can reference "fig1" when we do this.
exportgraphics(fig1, "one_axis_multiple_lines.png")


%% Exercise 2 – Create 1 figure with 4 axes on a grid.
% Task 0: we begin with creating a new figure to make sure we aren't 
%         touching the old figure!
fig2 = figure(2);

% Use "sgtitle" for "subplot grid title" – a title for the whole figure
sgtitle("1 + sin(2\pi t) for four discretizations", "FontSize", 20)

% We already have the discretizatons for N=8, 20, and 100. 
% Let's plot them on the subplots
subplot(2, 2, 1);
plot(t1, y1, "LineWidth", 2);
plot_title = "dt = " + (t1(2) - t1(1));
title(plot_title, "FontSize", 14);
ylim([-0.5, 2.5]);
xlabel("t (milliseconds)", "FontSize", 16);

subplot(2, 2, 2);
plot(t2, y2, "LineWidth", 2)
plot_title = "dt = " + (t2(2) - t2(1));
title(plot_title, "FontSize", 14);
ylim([-0.5, 2.5]);
xlabel("t (milliseconds)", "FontSize", 16);


subplot(2, 2, 3);
plot(t3, y3, "LineWidth", 2)
plot_title = "dt = " + (t3(2) - t3(1));
title(plot_title, "FontSize", 14);
ylim([-0.5, 2.5]);
xlabel("t (milliseconds)", "FontSize", 16);


% Need to create t4 and y4 first, then plot
t4 = linspace(0, 2, 200);
y4 = 1 + sin(2*pi*t4);
subplot(2, 2, 4);
plot(t4, y4, "LineWidth", 2)
plot_title = "dt = " + (t4(2) - t4(1));
title(plot_title, "FontSize", 14);
ylim([-0.25, 2.25]);
xlabel("t (milliseconds)", "FontSize", 16);

% Save figure 2
exportgraphics(fig2, "four_axes_grid.png")
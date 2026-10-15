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
t1 = linspace(0, 2, 8); % An array discretizing [0, 2] with 8 points.
% Then discretize the function
y1 = 

% Task 2: Repeat task 1 using 20 points in the discretization
N2 = 20;

% Task 3: Repeat task 1 using 100 points
N3 = 100;

% Beautify your figure!


% Final thing: save the figure! We can reference "fig1" when we do this.
exportgraphics(fig1, "one_axis_multiple_lines.png")


%% Exercise 2 – Create 1 figure with 4 axes on a grid.
% Task 1: we begin with creating a new figure to make sure we aren't 
%         touching the old figure!

% Task 2: Use "sgtitle" for "subplot grid title" – a title for the whole figure
% Uncomment the line below to create the sgtitle.
% sgtitle("1 + sin(2\pi t) for four discretizations", "FontSize", 20)

% Task 3 & 4
% We already have the discretizatons for N=8, 20, and 100. 
% Let's plot them on the subplots



% Need to create t4 and y4 first, then plot

% Task 5
% Save figure 2

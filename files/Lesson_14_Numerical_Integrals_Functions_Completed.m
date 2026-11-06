close all; clear; clc;

%% Task 1: Setup variables
a = 0; b = 1; 
f = @(x) sin(x.^2);

%% Task 2: Discretize
dx = 1e-3;
x = a:dx:b;
y = f(x); % This is why it's important we use .^ above

%% Task 3: LHR using loop and array arithmetic
% Loop first
LHR = 0; % initialize
for k = 1:length(y)-1 % We add up all heights except the last
    LHR = LHR + dx * y(k);
end
disp("LHR from loop = " + num2str(LHR, 10)) % This shows 10 decimals

% Array arithmetic
LHR = dx*sum(y(1:end-1));
disp("LHR from array arithmetic = " + num2str(LHR, 10))

%% Task 4: RHR using loop and array arithmetic
% Loop first
RHR = 0; % initialize
for k = 2:length(y) % We add up all heights except the first
    RHR = RHR + dx * y(k);
end
disp("RHR from loop = " + num2str(RHR, 10))

% Array arithmetic
RHR = dx*sum(y(2:end));
disp("RHR from array arithmetic = " + num2str(RHR,10))

%% Task 5: Trapezoidal rule
% Average first
trap = (LHR + RHR)/2;
disp("Trap rule from averaging = " + num2str(trap,10))

% Use summation formula
trap = dx/2 * (y(1) + y(end) + 2*sum(y(2:end-1)));
disp("Trap rule from formula = " + num2str(trap,10))

% Use trapz
trap = trapz(x ,y);
disp("Trap rule from trapz = " + num2str(trap, 10))

%% Task 6 - using integral
exact = integral(f, a, b);
disp("Using integral we find " + num2str(exact, 10))
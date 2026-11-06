clear; close all; clc;

%% Load the data and convert to arrays
data = readtable("Asteroid_Data.csv");
nea = data.NEA;
date = data.Date;

%% Plot it, to remind of us what we are looking at
fig1 = figure(1);
semilogy(date, nea)
hold on
xlabel('Date', 'FontSize', 14)
ylabel('Total NEAs discovered', 'FontSize', 14)
title('Cumulative near-Earth asteroid discoveries (log scale)', 'FontSize', 14)

%% Convert to date array, calculate derivative
t = convert_datetime_to_number(date);
% Calculate the derivative
nea_rate = (nea(2:end) - nea(1:end-1)) ./ (t(2:end) - t(1:end-1));
t_rate = t(1:end-1); % These are the t values at which we have the derivative


%% Integrate the rate to get the original data back
% Use LHR
nea_recovered = sum(nea_rate(1:end-1).*(t_rate(2:end) - t_rate(1:end-1)));
disp("nea_discovered = " + nea_recovered)

% This is a confusing result! We have a negative value. That is actually
% because of how the data is ordered: we don't have increasing t values, we
% have decreasing t values. Therefore, we can recover the result by using a
% minus sign.

nea_recovered = -nea_recovered;
disp("Correct nea_discovered = " + nea_recovered)

% What does this compare to? It's a definite integral, so this should be
% the nea at the end of the dataset. Again, because the data is ordered in
% decreasing order, we are looking to compare to nea(1).
disp("Compare to nea(1): " + nea(1))





%% Functions below
function months_since_jan_1900 = convert_datetime_to_number(datetime_array)
% This function converts a datetime type to a number.
% In this case, the number will be "months since January 1, 1900
% The formmula is
%     t = 12*(year - 1900) + (month - 1) + (day - 1)/(days in that month)

% First, get the year, month, and day for each date
    y = year(datetime_array);    % Gives the year for each date
    m = month(datetime_array);   % Gives the month for each date
    d = day(datetime_array);     % Gives the day for each date

% The last thing we need is the number of days in that month.
% MATLAB has a function for this:
%    eomday(year, month) = number of days in the month in a given year
    months_since_jan_1900 = 12*(y - 1900) + (m - 1) + (d - 1)./eomday(y, m);
end
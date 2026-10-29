clear; close all; clc;

%% Load the data and convert to arrays
data = readtable("Asteroid_Data.csv");
nea = data.NEA;
date = data.Date;

%% Plot it, just to get an idea of what we are working with
fig1 = figure(1);
plot(date, nea);
xlabel('Date', 'FontSize', 14)
ylabel('Total NEAs discovered', 'FontSize', 14)
title('Cumulative near-Earth asteroid discoveries', 'FontSize', 14)

% Notice that it's a cumulative total
% Also notice that the scale is hard to read! The y axis covers several
% orders of magnitude. In such cases, it's better to use a log scale on the
% y axis. Use semilogy (logarithmic on y axis, normal on x axis)

% Semilogy plot
fig2 = figure(2);
semilogy(date, nea)
xlabel('Date', 'FontSize', 14)
ylabel('Total NEAs discovered', 'FontSize', 14)
title('Cumulative near-Earth asteroid discoveries (log scale)', 'FontSize', 14)

%% Convert to number of NEAs discovered per month since January 1, 1900
% Notice that (NUMBER OF NEAS)/MONTH is a RATE; it's a derivative!
% Remember for data we need to do (y(k+1) - y(k))/(t(k+1) - t(k)).

% Let's first try this with a for loop
%NEA_rate = (nea(2:end) - nea(1:end-1)) / (date(2:end) - date(1:end-1));

% Notice we get an error. It comes from the fact that "date" isn't an array
% of numbers. We need to convert to numbers.
% Let's create a new array t. This array will have numbers, representing
% the number of days since January 1, 1990. This is implemented in the
% function "convert_datetime_to_number" function at the bottom of the file
t = convert_datetime_to_number(date);

% Let's plot it again to make sure it makes sense
fig3 = figure(3);
semilogy(t, nea)
xlabel('Months since January 1, 1900', 'FontSize', 14)
ylabel('Total NEAs discovered', 'FontSize', 14)
title('Cumulative near-Earth asteroid discoveries', 'FontSize', 14)

% Now we can calculate the derivative
NEA_rate = (nea(2:end) - nea(1:end-1)) ./ (t(2:end) - t(1:end-1));

fig4 = figure(4);

subplot(2, 1, 1)
semilogy(t, nea)
xlabel('Months since January 1, 1900', 'FontSize', 14)
ylabel('Total NEAs discovered', 'FontSize', 14)
title('Cumulative total', 'FontSize', 14)

subplot(2, 1, 2)
semilogy(t(1:end-1), NEA_rate)
xlabel('Months since January 1, 1900', 'FontSize', 14)
ylabel('NEAs discovered per month', 'FontSize', 14)
title('Discovery rate', 'FontSize', 14)


function days_since_jan_1990 = convert_datetime_to_number(datetime_array)
% This function converts a datetime type to a number.
% In this case, the number will be "days since January 1, 1900
% The formmula is
%     t = 12*(year - 1900) + (month - 1) + (day - 1)/(days in that month)

% First, get the year, month, and day for each date
    y = year(datetime_array);    % Gives the year for each date
    m = month(datetime_array);   % Gives the month for each date
    d = day(datetime_array);     % Gives the day for each date

% The last thing we need is the number of days in that month.
% MATLAB has a function for this:
%    eomday(year, month) = number of days in the month in a given year
    days_since_jan_1990 = 12*(y - 1900) + (m - 1) + (d - 1)./eomday(y, m);
end
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


%% Convert to number of NEAs discovered per month since January 1, 1900
% Notice that (NUMBER OF NEAS)/MONTH is a RATE; it's a derivative!
% Remember for data we need to do (y(k+1) - y(k))/(t(k+1) - t(k)).



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
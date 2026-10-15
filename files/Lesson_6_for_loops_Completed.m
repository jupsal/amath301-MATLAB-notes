clear; clc

%% Exercise 1: Predict output of these loops.


% Question 1: What is the result of the code?
arr = -1:0.5:1;
for j = arr
    disp(j)
end


%{
% Question 2: What is the result of the code?
var = 0;
for j = 1:10
    var = var + 1;
end
disp(var)
%}

%{
% Question 3: What is the result of the code?
var = 0;
for j = 1:10
    var = var + j;
end
disp(var)
%}

%{
% Question 4: What is the result of the code?
for j = [3, 5, 9]
    j = j + 2;
    disp(j)
end
%}

%{
% Question 5: What is the result of the code?
arr = zeros(1, 3);
for j = 1:length(arr)
    arr(j) = j-10;
end
disp(arr)
%}


%{
% Question 6:
loop_arr = [1, 2, 3, 0, 0, 0];
% How do we turn this array into [1, 2, 3, 1, 4, 9]?
% Notice that [1, 4, 9] = [1, 2, 3].^2

for ...

%}

%% Exercise 2: Rabbit problem without an array
% Recall the rabbit problem. 
% What if we don't want to keep track of past numbers of rabbits, only the
% value after 20 years?

% Model 1: Exponential growth.
% Here, use the fact that rabbit population double each year.
% Starter code below
num_rab = 2; % Start with num_rab = 2 rabbits

% Update num_rab in the for loop below.
for j = 1:20
    num_rab = 2*num_rab;
end
model1_pop = num_rab;

% Model 2 (optional): Logistic growth with harvesting
num_rab = 2;
for j = 1:20
    num_rab = 2*num_rab*(1 - num_rab/1e7) - j;
end
model2_pop = num_rab;



%% Exercise 3: Nested for loop – challenge! 
% "Nesting" in coding refers to when we place one or more elements within
% another type of element. For example, sin(sqrt(3)) is an example of 
% "nested" function calls. 

%{ 
% Exercise 1: Nested for loop example
% Run the code below and discuss what you find with others

for j = [1, 2, 3]
    for k = [100, 200]
        disp("j = " + j)
        disp("k = " + k)
    end
    disp("--- End of j loop ---")
end

%}

%{ 
% Exercise 2: What is the output of the code?
var = 0;
for j = [1, 2, 3]
    var = var + j;
    for k = [100, 200]
        var = var + k;
    end
end
disp("var = " + var);
%}

%{ 
% Exercise 3: Reach exercise!
%Create the matrix
% [1, 2, 3;
%  2, 4, 6;
%  3, 6, 9]
% Using the starter code below

matrix = zeros(3); % Setup a matrix with 3 rows, 3 columns
creator_arr = [1, 2, 3];
for j = creator_arr
    for k = creator_arr
        % Update matrix here, updating row and column
    end
end
disp(matrix)
%}
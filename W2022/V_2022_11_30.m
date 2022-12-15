%%
% Nicht-parametischer Fit
% mit durchschnitssgerade
opts = detectImportOptions('Data/NHANES470.csv');
data = readtable('Data/NHANES470.csv', opts);

scatter(data.Age, data.Height);
f=fit(data.Age, data.Height, 'a+b*x', 'Startpoint', [0,0]);
plot(f, data.Age, data.Height);

%%
% Nicht-parametischer Fit
% mit spline
opts = detectImportOptions('Data/NHANES470.csv');
data = readtable('Data/NHANES470.csv', opts);

scatter(data.Age, data.Height);
f=fit(data.Age, data.Height, 'smoothingspline', 'SmoothingParam', 0.001);
plot(f, data.Age, data.Height);

%%
% Binäre Optimierungsprobleme
f = -[1 0.9 0.9 2 1.4 0.2 0.5 2.1];
A = [-1 -1 -1 0 0 0 0 0; 
    0 0 0 -1 -1 0 0 0; 
    0 0 0 0 0 1 1 1; 
    10 8 8 16 12 4 6 16];
b = [-2;-1;1;40];
Aeq = [];
beq = [];
lb = zeros(8);
ub = ones(8);
intcon = [1:8];

[v, opt] = intlinprog(f, intcon, A, b, Aeq, beq, lb, ub)

%%
% Binäres Optimierungsproblem -> Rucksack packen
f = -[3 5 2 11 4 6 2 15 12 9];
A = [3 7 4 12 8 10 9 14 10 12];
b = [60];
Aeq = [];
beq = [];
lb = zeros(10);
ub = ones(10);
intcon = [1:10];

[v, opt] = intlinprog(f, intcon, A, b, Aeq, beq, lb, ub)
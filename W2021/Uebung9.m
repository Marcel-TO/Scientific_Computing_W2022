%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 1
opts = detectImportOptions('NHANES470.csv');
data = readtable('NHANES470.csv', opts);


scatter(data.Age, data.BMI);
hold on;
f = fit(data.Age, data.BMI, 'smoothingspline', 'SmoothingParam', 0.00001);
plot(f, data.Age, data.BMI);

f(20);
f(40);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 1 mit mehreren Variablen
opts = detectImportOptions('NHANES470.csv');
data = readtable('NHANES470.csv', opts);

data.SexMale = strcmpi(data.Sex, 'male'); % Dummy Variable
             % strcmpi -> string compare

scatter(data.Age, data.BMI);

f(20);
f(40);

%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 2 Lotka-Volterra-Model
x(1) = 0.2;
y(1) = 4;

alpha = 2;
beta = 0.5;
gamma = 1;
delta = 0.1;

n = 1000;

for i=2:n
    x(i) = x(i - 1) + alpha * x(i-1) * (1-x(i - 1)) - beta * x(i - 1) * y(i - 1);
    y(i) = y(i - 1) + y(i - 1) * (gamma * x(i - 1) - delta);
end

t = linspace(1, n, n);
plot(t, x, '-r');
hold on;
plot(t, y, '-b');

% Phasenmodell
% hold off;
% plot(x,y);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 3 SIR-Model
N = 100;
Io = 0.1;
b = 0.45;
g = 0.13;

S(1) = 99;
I(1) = 1;
R(1) = 0;

n = 100;

for i=2:n
    S(i) = S(i - 1) - ((b * S(i - 1) * I(i - 1)) / N);
    I(i) = I(i - 1) + ((b * S(i - 1) * I(i - 1)) / N) - g * I(i - 1);
    R(i) = R(i - 1) + g * (i - 1);
end

x = linspace(1,n,n);
hold on;
plot(x,S, '-r');
plot(x,I, '-b');
plot(x,R, '-g');
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Beispiel 4 Linear Optimierungs Problem
% A1 A2 A3
% B1 B2 B3
% C1 C2 C3
f = [51,62,35;
    59,68,50;
    49,56,53];

A = [1,1,1,0,0,0,0,0,0; % A(0) <= b(0)
    0,0,0,1,1,1,0,0,0;  % A(1) <= b(1)
    0,0,0,0,0,0,1,1,1]; % A(2) <= b(2)
b = [15;
    20;
    15];
Aeq = [1,0,0,1,0,0,1,0,0;
       0,1,0,0,1,0,0,1,0;
       0,0,1,0,0,1,0,0,1];
beq = [11;
      12;
      9];

[x, fval, exitflag, output, lambda] = linprog(f,A,b,Aeq,beq,zeros(1,9),[]);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
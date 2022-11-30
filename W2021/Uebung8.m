%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 1
A = [];
b = [];
Aeq = [
    [0,1,1,0,-1];
    [1,0,-1,-1,0];
];
beq = [
    0;
    0;
];
lb = [];
ub = [3,2,5,2,3];

[x, fval, exitflag, output, lambda] = linprog(-[0,0,0,1,1], A, b, Aeq, beq, lb, ub);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 2
f = -[1, 0.9, 0.9, 2, 1.4, 0.2, 0.5, 2.1];
A = [-1, -1, -1, 0, 0, 0, 0, 0;
    0, 0, 0, -1, -1, 0, 0, 0;
    0, 0, 0, 0, 0, 1, 1, 1;
    10, 8, 8, 16, 12, 4, 6, 16];
b = [-2;
    -1;
    1;
    40];
Aeq = [];
beq = [];
lb = zeros(8);
ub = ones(8);

[x, opt] = intlinprog(f, 1:8, A, b, Aeq, beq, lb, ub);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 3
dataX = [0.5;1;1.5;2;2.5;3;3.5;4];
dataY=[6.8;3;1.5;0.75;0.48;0.25;0.2;0.15];
scatter(dataX, dataY, 'ob');
hold on;
f=fit(dataX, dataY, 'a*exp(b*x)', 'Startpoint', [0,0]);
hold on;
x=linspace(0,5,100);
plot(x,f(x), '-k');

beta = f.b;

startValue = f(0)
vorhersage = f(1.5);
halb = log(2) / beta;
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 4
opts = detectImportOptions('NHANES20.csv');
data = readtable('NHANES20.csv');

scatter(data.BMI, data.BPSys);
f = fit(data.BMI, data.BPSys, 'a+b*x', 'Startpoint', [0,0]);
hold on;
plot(f);

data.male = double(contains(data.Sex, 'Male'));
f = fit([data.BMI, data.male], data.BPSys, 'a+b*x+c*y', 'Startpoint', [0,0,0]);
v = f([25,1]);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 5
f = [10^6,9,7,13;
    16,13,8,10^6;
    10,10^6,6,15;
    11,10^6,13,17];
intcon = 1:16;
Aeq = [
    1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1;
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0;
    0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0;
    0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0;
    0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1
    ];
beq = ones(1,8);
A =[];
b = [];
lb = zeros(1,16);
ub = ones(1,16);

[x,fval,exitflag,output] = intlinprog(f,intcon,A,b,Aeq,beq,lb,ub);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
% 1)
v = [32; 50; 79; 102; 126];
s = [17.82; 27.90; 57.15; 90.25; 153.83];
scatter(v, s);
f = fit(v, s, 'a*x^2 +b*x +c');
hold on;
x=linspace(0,140,100);
plot(x,f(x), '-k');

f(25)
f(120)

%%
% 2)
datax = [0.5;1;1.5;2;2.5;3;3.5;4];
datay = [6.6;3;1.5;0.75;0.5;0.23;0.18;0.14];
scatter(datax, datay);
f = fit(datax, datay, 'a*exp(b*x)');
hold on;
x=linspace(0,4,100);
plot(x,f(x), '-k');
f(0)
f(60/50)

[v, opt] = fminunc(f, [0,0]);

%%
% 3)
data=readmatrix("Data/Daten Test 3-20221207/ProcessYield_3.csv");
T=data(:,1);
p=data(:,2);
Y=data(:,3);
scatter3(T,p,Y, 'ob');

f=fit([T,p], Y, 'a*x+b*y+c');
hold on;
x = linspace(0,100,100);
y = linspace(0,250,100);
[X,Y] = meshgrid(x,y);
mesh(X,Y,f(X,Y));

f(5,25) % Interpolation
f(150,125) % Extrapolation

%%
% 4)
data=readmatrix("W2022/Daten Test 3-20221207/NHANES_BP_MTLB_9.csv");

scatter(data(:,1),data(:,2));
fLinear = fit(data(:,1),data(:,2), 'b*x+d');
f = fit(data(:,1),data(:,2), 'smoothingspline', 'smoothingParam', 0.01); 
plot(f,data(:,1),data(:,2));

f(90)
fLinear(90)

%%
% 5)
f = -[14 12 16]; % Das minus ist, weil man das Maximium will.
A = [40 20 30; 20 10 50; 50 50 50];
b = [300; 100; 600];
Aeq = [];
beq = [];
lb = [0 0 0];
ub = [];
linprog(f, A, b, Aeq, beq, lb, ub)

%%
% 6)
f = -[55 56 35 18 25 84 80 105];
A = [-1 -1 -1 0 0 0 0 0; 
    0 0 0 -1 -1 0 0 0; 
    0 0 0 0 0 -1 -1 0; 
    0 0 0 0 0 0 0 -1; 
    1 1 1 0 0 0 0 0;
    0 1 1 1 0 0 0 0;
    0 0 1 1 1 0 0 0;
    5 4 5 3 5 7 8 7];
b = [-1;-1;0;0;3;3;3;22];
Aeq = [];
beq = [];
lb = zeros(8);
ub = ones(8);
intcon = [1:8];

[v, opt] = intlinprog(f, intcon, A, b, Aeq, beq, lb, ub)
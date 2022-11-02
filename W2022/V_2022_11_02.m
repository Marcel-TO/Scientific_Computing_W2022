%%
% Self-Check Random a)
n = 10^6;
a = randi(90,1,n);
b = randi(90,1,n);

res = sum(a+b >= 60)/n*100;
%%
% Self-Check Random b)
n = 10^6;
x = randn(1, n);
y = randn(1, n);
res = sum(x.^2 + y.^2 >= 2)/n*100;

%%
% Self-Check Spline
x = [-15,-10,25,35];
y = [3.9, 3.8, 6.4, 6.5];
x_interp = [-15:35];
y_interp = spline(x,y,x_interp);
plot(x_interp, y_interp, '-r');
res = interp1(x,y, 0)

%%
% Self-Check Equation
format longG
g = 9.8065;
k = 0.00341;
y = @(t) (log(cosh(t*sqrt(g*k))))/k;
res = y(34)

%%
% Poissrnd Nieren

muA = 1;
muB = 2;

gA = exprnd(muA, 1, n);
gB = exprnd(muB, 1, n);

poissA = poissrnd(gA);
poissB = poissrnd(gB);

poissAB = poissrnd(gB - gA);

wA = sum(poissA > 0) / n;

wB = sum((((poissA >= 2) .* (gB > gA)) + (poissA == 0) .* (gB > gA) .* (poissAB >= 1) + (gB < gA) .* (poissB >= 2)) / n);

%%
% Nichtlineare Optimierungsprobleme
% [v, opt] = fminunc(f, start);
% f: Funktion welche optimiert wird
% start: Startpositon

f = @(v)0.5.*v(1).^2 + 2.5.*v(2).^2;
[v, opt] = fmincon(f, [1,1]);
x = v(1);
y = v(2);
plot(x,y);

%%
% Optimierungen mit Nebenbedingungen
% [v, opt] = fminunc(f, start, A, b, Aeq, beq, lb, ub, confun); 
%    ^
%    |
%  Siehe Folien

f = @(v) 0.5.*v(1)^2+2.5.*v(2).^2
start = [1,1];
A=[-1,-1];
b=[-0.5];
[v, opt]=fmincon(f,start,[-1,-1],[-0.5]);

%%
f = @(v) 0.5.*v(1)^2+2.5.*v(2).^2
start = [1,1];
Aeq=[0,1];
beq=[1];
[v, opt]=fmincon(f,start, [], [], Aeq, beq);

%%
f = @(v) 0.5.*v(1)^2+2.5.*v(2).^2
start = [1,1];
lb=[0.9,0.9];
ub=[1.1,1.1];
[v, opt]=fmincon(f,start, [], [], [], [], lb, ub);

%%
% Constraint
f = @(v) 0.5.*v(1)^2+2.5.*v(2).^2
[v, opt]=fmincon(f, [1,1],[],[],[],[],[],[], @confun);
x=v(1);
y=v(2);

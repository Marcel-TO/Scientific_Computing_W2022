%%
% Symbolisches Rechnen in Matlab
x=0.362;
y=36.2;
100*x==y

%%
% Überprüfung mit Fehlertoleranz
abs(100*x-y)<10^(-6)

%%
% Symbolische variablen
x=sym(0.362);
y=sym(36.2);
res = 100*x==y;
simplify(res)

%%
% Symbolisches Lösen von Gleichungen
syms x;
sol = solve(x^2-2==0,x);
result =double(sol)
    
%%
syms x;
sol = solve(x^3+2*x^2+x+1==0,x);
result = double(sol)

%%
syms x y;
sol1 = solve(exp(x)==y, x)
sol2 = solve(exp(2*x)==y,x)

%%
% Symbolisches Losen eines Gleichungssysems
syms x y;
solutions = solve([x^2==2,y==0], [x,y]);
sol=[solutions.x solutions.y]
result = double(sol)

%%
% Symbolisches Vereinfachen
syms x;
p=(x^2-1)/(x-1);
simplify(p)

%%
% Symbolisches Substituieren
syms x;
p=x^2-1;
disp(subs(p,x,1));

%%
% Symbolische Funkionen
x= [0:4];
y=x.^2;

syms x.......
    
%%
% Symbolische Differentation
syms x;
f(x)=x^2;
disp(diff(f, x)); % 1. Ableitung
disp(diff(f,x,x)); % 2. Ableitung

%%
% Symbolische Differentation in mehreren Variablen
syms x y;
f(x,y)=1+x^2+y^2;
diff(f,x)

%%
% Symbolische Integration
syms x;
f(x)=x^2;
int(f,x);
inf(f,x,0,1)

%%
% Wahrscheinlichkeisverteilung -> Exponentiell
% exprnd(mu, n, m)
n = 100;
sum(exprnd(n,1)); % Durchschnittliche Lebensdauer von n Glühbirnen

% a)
n = 10;
resA = exprnd(10, 1); % Lebenserwartungen von 10 Glühbirnen

% b)
mittelDauer = 100; % Durchschniliche Lebensauer liegt bei 100 Stunden
n = 10^6;

G_1 = exprnd(mittelDauer, 1, n);
G_2 = exprnd(mittelDauer, 1, n);

resB = mean((G_1 <= 50) & (G_2 <= 50));
disp(resB);

%%
% Wahrscheinlichkeitsverteilung -> Poisson
% poissrnd(la,n,m)
lambda = 10;
resA = poissrnd(lambda, 1, 8); % Simulieren Sie die ankommenden Kunden an einem Tag(8 Stunden)

lambda = 80;
pois = poissrnd(lambda, 1, 10^6); % Mi welcher Wahrscheinlichkeit kommen an einem ag mehr als 100 Kunden
resB = mean(pois > 100);

%%
% Räumliche Poisson-Verteilung
len=2;
la=8;
N=poissrnd(len*la,1,1); % Anzahl an Fehler die auftreten
x=rand(1,N)*len; % Fehler zufällig verteilen
scatter(0*x,x);

%%
height=2;
width=3;
la=8;
N=poissrnd(height*width*la,1,1);
x=rand(1,N)*width;
y=rand(1,N)*height;
scatter(x,y);
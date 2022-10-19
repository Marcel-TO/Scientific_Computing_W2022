%%
% Aufgabe 1
x = [1950, 1960, 1970, 1980, 1990, 2000, 2010];
y = [dfdf]

x_interpolation = [1950:2010];
y_inerpolation = spline(x,y,x_inerpolaion);
plot(x,y,'bo');
hold on;
plot(x_interpolation, y_interpolation, '-r');

y_2005 = spline(x,y, 2005);

%%
% Aufgabe 2
k = 0.00431;
g = 9.81;
y = @(t) log(cosh(t.*sqrt(g*k)))/k;
% plot([0:0.01:8],y([0:0.01:8]));

y60 = @(t)(log(cosh(t.*sqrt(g*k)))/k)-60;
fsolve(y60,0.1)
%%
% Aufgabe 3

f = @(t) 2500./(1+9.*exp(-t./3));
t = [0:0.1:40];
N = f(t);
plot(t,N,'-b');

y = @(t) 2500./(1+9.*exp(-t./3))-1000;
t = fsolve(y,5)
%%
% Aufgabe 4
M = [0,0.5,0.4,0.4;
    0.9,0.6,0.9,0.3;
    0.9,0.9,0.3,0.5;
    0.1,0.5,0,0.7];
b = [0.5;0;0.8;0.5];
v=M\b;
fprintf("\n\t x1 = %.3f, x2 = %.3f, x3 = %.3f, x4 = %.3f", v(1), v(2), v(3), v(4));
%%
% Aufgabe 5
% Travelling Salesman
M = [0,150,80,inf,90;
    150,0,100,125,100;
    80,100,0,50,125;
    Inf,125,50,0,100;
    
    
    90,100,125,100,0];
GetShortestPath(M)
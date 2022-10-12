%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Self-Check

% 1)
%{
f = @(x) 2 + (2/3).*x - 2.*x.^2+x.^3;
x=linspace(0,2,100);
y=f(x);
plot(x,y);
max = max(y);
hold on;

for x=0:2
    y=f(x);
    plot(x,y, '-o');
end
%}

%{
% 2)
N = @(t) 750 ./(1+4.*exp((-t./5)));
t=linspace(0,30,100);
y=N(t);
plot(t,y);
y0=N(0);
disp(y0);
y30=N(30);
disp(y30);
%}

%{
% 3)
x=linspace(-3,3,100);
y=linspace(-3,3,100);

[X,Y] = meshgrid(x, y);
Z = 5.20 + 2.*X - 4.*Y + x.^2 + Y.^2; % z=x^2+y^2
minX = min(X);
mesh(X,Y,Z);
contour(X,Y,Z, 100);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Self-Check Markow-Matrix
M=[0.6,0.1,0.3;
    0.1,0.8,0.3;
    0.3,0.1,0.4];
Zustand = [0;1;0];

%{
% a)
for i=1:3
    Zustand = M * Zustand;
end

disp(Zustand);
%}
%{
% b)
for i=1:15
    Zustand = M * Zustand;
end

disp(Zustand);
%}
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Self-Check Markow-Matrix V2
M=[0.7,0.3,0.3;
    0.2,0.8,0.2;
    0.1,-0.1,0.5];
Zustand = [1;0;0];

%{
% a)
for i=1:5
    Zustand = M * Zustand;
end

disp(Zustand);
%}
%{
% b)
for i=1:18
    Zustand = M * Zustand;
end

disp(Zustand);
%}
%{
% c)
[v, la] = eig(M);
%}
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Interpolation
x=[1961,1971,1981,1990,2000,2010,2018];
y=[7.074,7.492,7.555,7.678,8.012,8.352,8.822];
x_interp=[1961:2018];
y_interp=interp1(x,y,x_interp);
plot(x,y,'bo');
hold on;
plot(x_interp, y_interp, '-r')
y_2015=interp1(x,y,2015);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Spline-Interpolation
x=[1961,1971,1981,1990,2000,2010,2018];
y=[7.074,7.492,7.555,7.678,8.012,8.352,8.822];
x_interp=[1961:2018];
y_interp=spline(x,y,x_interp);
plot(x,y,'bo');
hold on;
plot(x_interp, y_interp, '-r')
y_2015=interp1(x,y,2015);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Nullstellen von Funktionen
f = @(x) x.^2 - 2;
x=fsolve(f,2);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{

%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{

%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{

%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{

%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
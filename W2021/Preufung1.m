%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispie 1
res = sum(cos(1:170));
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 2
format long;
f1 = F_recursive(1);
f2 = F_recursive(2);
f3 = F_recursive(13);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 3
x=[-15,-10,25,35];
y=[4, 4.3, 6, 6.8];
x_interp=[-15:35];
y_interp=spline(x,y,x_interp);
plot(x,y,'bo');
hold on;
plot(x_interp, y_interp, '-r');

zero = spline(x,y, 0);

%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Beispiel 4
g = 9.8065;
k = 0.00341;
y = @(x) log(cosh(x*sqrt(g*k)))/k;
x = linspace(0,100,100);
plot(x, y(x));

%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
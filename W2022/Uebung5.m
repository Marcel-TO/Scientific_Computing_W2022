%%
% Aufgabe 1
f=@(x,y) x.^4 + 4.*x.^3 + x.^2.*y - 24.*x.^2 + 3.*x.^2.*y - 24.*y.^2 + y.^4 + 1;

x=linspace(-8,5,100);
y=linspace(-6,6,100);

[X,Y] = meshgrid(x,y);
Z= f(X,Y);

mesh(X,Y,Z);
% contour(X,Y,Z,100);

%%
% Aufgabe 2
format shortG
f=@(x,y) x.^4 + 4.*x.^3 + x.^2.*y - 24.*x.^2 + 3.*x.^2.*y - 24.*y.^2 + y.^4 + 1;
g=@(v) f(v(1), v(2));

[v, opt] = fminunc(g, [-4,-4]);
disp(opt);

%%
% Aufgabe 3

%%
% Aufgabe 4


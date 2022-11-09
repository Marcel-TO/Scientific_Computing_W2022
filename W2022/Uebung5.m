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
% Euklidische Distanz von Lieferungen
% a
f = @(v) 85*sqrt((1-v(1))^2 + (1-v(2))^2) + 40*sqrt((1-v(1))^2 + (-1-v(2))^2) + 80*sqrt((-1-v(1))^2 + v(2)^2);
unc = fminunc(f,[0,0]);

%%
% b
f2 = @(x,y) 85*sqrt((1-x).^2 + (1-y).^2) + 40*sqrt((1-x).^2 + (-1-y).^2) + 80*sqrt((-1-x).^2 + y.^2);
[v, opt] = fmincon(f, [1,1], [], [], [], [], [0.5,0.5], [1.5,1.5]);
x = linspace(-1,1,100);
y = linspace(-1,1,100);
[X,Y] = meshgrid(x,y);
Z = f2(X,Y);
mesh(X,Y,Z);

%%
% c -> Lagerhaus mus sich auf x-Achse befinden(y=0)
f2 = @(x,y) 85*sqrt((1-x).^2 + (1-y).^2) + 40*sqrt((1-x).^2 + (-1-y).^2) + 80*sqrt((-1-x).^2 + y.^2);
[v, opt] = fmincon(f, [1,1], [], [], [0,1], [0]);
x = linspace(-1,1,100);
y = linspace(-1,1,100);
[X,Y] = meshgrid(x,y);
Z = f2(X,Y);
mesh(X,Y,Z);
contour(X,Y,Z,100);

%%
% d -> Lagerhaus muss ich aufder linken Halbebene befinden(x < 0)
f2 = @(x,y) 85*sqrt((1-x).^2 + (1-y).^2) + 40*sqrt((1-x).^2 + (-1-y).^2) + 80*sqrt((-1-x).^2 + y.^2);
[v, opt] = fmincon(f, [0,1], [1,0], [0]);

%%
% e -> Lagerhaus befindet sich innerhalb eines Radius von 0.5 um Position A
% function confun erstellt -> Siehe confun.m -> V_2021_11_10  Lagerhaus Beispiel E

f2 = @(x,y) 85*sqrt((1-x).^2 + (1-y).^2) + 40*sqrt((1-x).^2 + (-1-y).^2) + 80*sqrt((-1-x).^2 + y.^2);
[v, opt] = fmincon(f, [1,1], [], [], [], [], [], [], @confun);

%%
% Aufgabe 4


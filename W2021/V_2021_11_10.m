%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Euklidische Distanz von Lieferungen
% a
f = @(v) 85*sqrt((1-v(1))^2 + (1-v(2))^2) + 40*sqrt((1-v(1))^2 + (-1-v(2))^2) + 80*sqrt((-1-v(1))^2 + v(2)^2);
unc = fminunc(f,[0,0]);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% b
f2 = @(x,y) 85*sqrt((1-x).^2 + (1-y).^2) + 40*sqrt((1-x).^2 + (-1-y).^2) + 80*sqrt((-1-x).^2 + y.^2);
[v, opt] = fmincon(f, [1,1], [], [], [], [], [0.5,0.5], [1.5,1.5]);
x = linspace(-1,1,100);
y = linspace(-1,1,100);
[X,Y] = meshgrid(x,y);
Z = f2(X,Y);
mesh(X,Y,Z);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% c -> Lagerhaus mus sich auf x-Achse befinden(y=0)
f2 = @(x,y) 85*sqrt((1-x).^2 + (1-y).^2) + 40*sqrt((1-x).^2 + (-1-y).^2) + 80*sqrt((-1-x).^2 + y.^2);
[v, opt] = fmincon(f, [1,1], [], [], [0,1], [0]);
x = linspace(-1,1,100);
y = linspace(-1,1,100);
[X,Y] = meshgrid(x,y);
Z = f2(X,Y);
mesh(X,Y,Z);
%contour(X,Y,Z,100);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% d -> Lagerhaus muss ich aufder linken Halbebene befinden(x < 0)
f2 = @(x,y) 85*sqrt((1-x).^2 + (1-y).^2) + 40*sqrt((1-x).^2 + (-1-y).^2) + 80*sqrt((-1-x).^2 + y.^2);
[v, opt] = fmincon(f, [0,1], [1,0], [0]);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% e -> Lagerhaus befindet sich innerhalb eines Radius von 0.5 um Position A
% function confun erstellt -> Siehe confun.m -> V_2021_11_10  Lagerhaus Beispiel E

f2 = @(x,y) 85*sqrt((1-x).^2 + (1-y).^2) + 40*sqrt((1-x).^2 + (-1-y).^2) + 80*sqrt((-1-x).^2 + y.^2);
[v, opt] = fmincon(f, [1,1], [], [], [], [], [], [], @confun);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Lineare Optimierung mit matlab-Funktion linprog(f,A,b);
linprog([0,1], [1 -1; -1 0; 0 1], [0,-1,2]);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Landwirtschaft-Ackerland-Gewinn
ha = 60;
h = 1400;
m = 20; % Mais = 20/ha
k = 40; % Kürbis = 40/ha

linprog(-[400, 500], [1, 1; 20, 40], [ha; h]);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
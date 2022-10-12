%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Interp1 -> connects dots
x=[1961,1971,1981,1990,2000,2010,2018];
y=[7.074,7.492,7.555,7.678,8.012,8.352,8.822];
x_interp=[1961:2018];
y_interp=interp1(x,y,x_interp);
plot(x,y,'bo');
hold on;
plot(x_interp, y_interp, '-r');
y_2015=interp1(x,y,2015);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Spline abgerundete connection lines
x=[1961,1971,1981,1990,2000,2010,2018];
y=[7.074,7.492,7.555,7.678,8.012,8.352,8.822];
x_interp=[1961:2018];
y_interp=spline(x,y,x_interp);
plot(x,y,'bo');
hold on;
plot(x_interp, y_interp, '-r');
y_2015=spline(x,y,2015);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Nicht-lineare Gleichungen
% function -> fsolve(f,x_0)

f= @(x) x.^2-2;
x=fsolve(f,2);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% x^2 + y^2 - 1 = 0
% x - y^2 = 0

f = @(v) [v(1).^2+v(2).^2-1, v(1)-v(2).^2];
v=fsolve(f,[1,1]);
x1=v(1);
y1=v(2);

v=fsolve(f, [1,-1]);
x2=v(1);
y2=v(2);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Nichtlineare Optimierungsprobleme
% [v, opt] = fminunc(f, start);
% f: Funktion welche optimiert wird
% start: Startpositon

f = @(v)0.5.*v(1).^2 + 2.5.*v(2).^2;
[v, opt] = fminunc(f, [1,1]);
x = v(1);
y = v(2);
plot(x,y);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
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
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
f = @(v) 0.5.*v(1)^2+2.5.*v(2).^2
Aeq=[0,1];
beq=[1];
[v, opt] = fmincon(f, [1,1],[],[],[0,1],[1]);
x=v(1);
y=v(2);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
f = @(v) 0.5.*v(1)^2+2.5.*v(2).^2
lb=[0.9,0.9];
ub=[1.1,1.1];
[v, opt] = fmincon(f, [1,1],[],[],[],[],[0.9,0.9],[1.1,1.1]);
x=v(1);
y=v(2);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Lineare Gleichungs Constraints
% function confun erstellen! -> Siehe confun.m -> linearer constraint

f = @(v) 0.5.*v(1)^2+2.5.*v(2).^2
[v, opt]=fmincon(f, [1,1],[],[],[],[],[],[], @confun);
x=v(1);
y=v(2);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Nicht-lineare Gleichungs Constraint
% function confun erstellen! -> Siehe confun.m -> nicht-linearer constraint
f = @(v) 0.5.*v(1)^2+2.5.*v(2).^2
[v, opt]=fmincon(f, [1,1],[],[],[],[],[],[], @confun);
x=v(1);
y=v(2);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% BruteForce Aufgabe fürs nächste Mal:
% 10 Gegenstände, unterschiedliches Gewicht -> optimale Auswahl
% 2^10 Möglichkeiten (1024) -> nutze Funktion "nchoosek()" -> nchoosek([1:10],2)
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

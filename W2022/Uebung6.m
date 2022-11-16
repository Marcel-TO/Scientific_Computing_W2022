%%
% Aufgabe 1
q = 30;
a = 0.005;
k = 0.16;
h = 20;
Tinf = 6.85;
fmin = @(r) (q/ (2*pi))*(log(r/a)/k+1/(h*r))+Tinf;
[r, opt] = fminunc(fmin, 5);

x=linspace(0.005, 0.01, 1000);
fmin2 = @(x) (q/ (2*pi))*(log(x./a)/k+1/(h.*x))+Tinf;
plot(x, fmin2(x));

%%
% Aufgabe 2 linear
datax = [1950;1960;1970;1980;1990;2000;2010];
datay = [2558;3043;3713;4451;5289;6089;6859];
scatter(datax,datay, 'ob');
hold on;

f = fit(datax, datay, 'a*x+b');
x = linspace(1950,2060,100);
plot(x,f(x), '-k');
hold off;
format longg;
f(2022)

%%
% Aufgabe 2 exponential
datax = [1950;1960;1970;1980;1990;2000;2010];
datay = [2558;3043;3713;4451;5289;6089;6859];
scatter(datax,datay, 'ob');
hold on;

f = fit(datax, datay, 'a*exp(b*x)', "Startpoint", [0,0]);
x = linspace(1950,2060,100);
plot(x,f(x), '-k');
hold off;
format longg;
f(2022)

%%
% Aufgabe 3
datax = [32;50;80;100;125];
datay = [16.2;31;63.5;95;146.6];
scatter(datax,datay, 'ob');


f=fit(datax, datay, 'a*x^2+b*x+c');
hold on
x=linspace(30,125,100);
plot(x,f(x),'-k');
f(90)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
lb = zeros(1,4);
lb(3) = 400;
ub = [];
f = [1,1,1,1];
A = [2,3,4,5; 3,4,5,6;15,10,9,7];
b = [3300; 4000; 12000];

[x, fval, exitflag, output, lambda] = linprog(-f,A,b,[],[],lb, ub);
% lambda besitzt Schattenpreise -> Gibt aus wie viel es sich bringen würde
% mehr von etwas herzustellen.
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Diskrete Optimierungsprobleme -> Maximierung mit zusätzlichen
% Einschränkungen dass x und y ganzzahlig sind.

% -> intlinprog(f, intcon, A, B)
% intcon definiert integer conditions: [1:2] definiert, dass die variable 1
% und 2 integer sein sollen.

f = [-1,-1];
intcon = 1:2;
A = [2,3;3,-2];
b = [9,5];
res = intlinprog(f, intcon, A, b);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Curve-Fitting versus Interpolation
% Regression -> matlab: fit (kleine Probleme mit 2 unbekannten Faktoren)
% lineare Regression -> matlab: lmfit (größere Probleme mit mehreren unbekannten Faktoren)

% -> Methode der kleinsten Quadrate

dataX = [1;2;3;4];
dataY=[1.0;3.2;1.5;4.0];
scatter(dataX, dataY, 'ob');
f=fit(dataX, dataY, 'a*x+b');
hold on;
x=linspace(0,6,100);
plot(x,f(x), '-k');

interPolation = f(3.5);
extraPolation = f(4.5);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Polynomiales Modell -> mit fit lösen
dataX = [1;2;3;4];
dataY=[1.0;3.2;1.5;4.0];
scatter(dataX, dataY, 'ob');
f=fit(dataX, dataY, 'a*x^2+b*x+c');
hold on;
x=linspace(0,5,100);
plot(x,f(x), '-k');

interPolation = f(3.5);
extraPolation = f(4.5);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Exponentielles Modell
dataX = [1;2;3;4];
dataY=[1.0;3.2;1.5;6.0];
scatter(dataX, dataY, 'ob');
hold on;
f=fit(dataX, dataY, 'a*exp(b*x)', 'Startpoint', [0,0]);
hold on;
x=linspace(0,5,100);
plot(x,f(x), '-k');

vorhersage = f(3.5);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Prediktoren in Matlab
datax=[0;0;0;0;0.3;0.3;0.3;0.3;0.7;0.7;0.7;0.7;1;1;1;1];
datay=[0;0.3;0.7;1;0;0.3;0.7;1;0;0.3;0.7;1;0;0.3;0.7;1];
dataz=[1.2;2;1.7;2.4;2;2.6;2.8;2.8;2.4;2.4;3.3;3.7;2.9;2.7;3.1;3.3];
scatter3(datax, datay, dataz, 'ob');
hold on;
f=fit([datax,datay], dataz, 'a*x+b*y+c');
hold on;
x=linspace(0,1,100);
y=linspace(0,1,100);
[X,Y]=meshgrid(x,y);
mesh(X,Y,f(X,Y));

vorhersage= f(0.5,0.5); % <- Modellvorhersage
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Read from File
opts = detectImportOptions('SurveyData.csv');
data = readtable('Surveydata.csv', opts);

% Variablen im Surveydata.csv File:
% Age
% Sex
% Wr_Hnd
% Height


scatter(data.Wr_Hnd, data.Height);
f=fit(data.Wr_Hnd, data.Height, 'a+b*x', 'Startpoint', [0,0]);
plot(f);
plot(f, data.Wr_Hnd, data.Height);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Mehrere Prediktoren (Multilineare Regression)
opts = detectImportOptions('SurveyData.csv');
data = readtable('Surveydata.csv', opts);

data.male = double(contains(data.Sex, 'Male'));
f = fit([data.Wr_Hnd, data.male], data.Height, 'a+b*x+c*y', 'Startpoint', [0,0,0]);
plot(f);

f(22.5,1)
confidence = predint(f, [22.5,1]);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Nett to know
% matlab: fitlm

opts = detectImportOptions('SurveyData.csv');
data = readtable('Surveydata.csv', opts);

model = fitlm(data, 'Height ~ data.Wr_Hnd+data.male');
beta = model.Coefficients.Estimate;
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
% Fitting mit mehreren Prediktoren
datax = [0;0;0;0;0.3;0.3;0.3;0.3;0.7;0.7;0.7;0.7;1;1;1;1];
datay = [0;0.3;0.7;1;0;0.3;0.7;1;0;0.3;0.7;1;0;0.3;0.7;1];
dataz = [1.2;2;1.7;2.4;2;2.6;2.8;2.8;2.4;2.4;3.3;3.7;2.9;2.7;3.1;3.3];
scatter3(datax,datay,dataz,'ob');

f=fit([datax,datay], dataz, 'a*x+b*y+c');

hold on;
x = linspace(0,1,100);
y = linspace(0,1,100);
[X,Y] = meshgrid(x,y);
mesh(X,Y,f(X,y));

%%
% Prognose Körpergröße von Handspanne
opts = detectImportOptions('./W2021/SurveyData.csv');
data = readtable('./W2021/Surveydata.csv', opts);

% Variablen im Surveydata.csv File:
% Age
% Sex
% Wr_Hnd
% Height


scatter(data.Wr_Hnd, data.Height);
f=fit(data.Wr_Hnd, data.Height, 'a+b*x', 'Startpoint', [0,0]);
plot(f);
plot(f, data.Wr_Hnd, data.Height);
predint(f, 22.5)
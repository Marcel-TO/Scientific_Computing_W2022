%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
opts = detectImportOptions('NHANES470.csv');
data = readtable('NHANES470.csv', opts);

scatter(data.Age, data.Height);
hold on;

f = fit(data.Age, data.Height, 'smoothingspline'); % Zu viel Freiheitsgrade
plot(f, data.Age, data.Height);

% Vorhersagen:
v = f(18);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
opts = detectImportOptions('NHANES470.csv');
data = readtable('NHANES470.csv', opts);

scatter(data.Age, data.Height);
hold on;

f = fit(data.Age, data.Height, 'smoothingspline', 'SmoothingParam', 0.001);
plot(f, data.Age, data.Height);

% Vorhersagen:
v = f(18);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% exponentielles Wachstum
m = ones(1, 100);

for i = 2:100
    m(i) = m(i - 1) + 0.1 .* m(i - 1);
end

x=1:100;
plot(x,m);

%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Logistisches Wachstum
% Formel: xn = xn-1 + mü * (1 - xn-1) * xn-1

m = zeros(1,100);
m(1) = 0.01;

for i = 2:100
    m(i) = m(i - 1) + 0.1 .* (1 - m(i - 1)) .* m(i - 1);
end

x=1:100;
plot(x,m);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Lotka-Volterra Model
% SIR-Model
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
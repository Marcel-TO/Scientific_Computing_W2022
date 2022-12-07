%%
% Aufgabe 1
opts = detectImportOptions("W2021/NHANES470.csv");
data = readtable("W2021/NHANES470.csv", opts);

scatter(data.Age, data.BMI);
hold on;

fLinear = fit(data.Age, data.BMI, 'b*x+d'); % linear
%f = fit(data.Age, data.BMI, 'smoothingspline');
f = fit(data.Age, data.BMI, 'smoothingspline', 'smoothingParam', 0.001); % Mit Parameter für besseren Durchschnitt

plot(f, data.Age, data.BMI);
xlabel('Age');
ylabel('BMI');

f(40)
fLinear(40)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 1
M=[30, 23, 40, 38;
   51, 28, 48, 46;
   52, 44, 40, 47;
   31, 42, 22, 59];

Weg = zeros(4,4);
shortestW=inf;
shortestX=0;
shortestY=0;

for xL=1:4
    for yL=1:4
        for xK=1:4
            for yK=1:4                              % Manhatten Distanz (x2 - y)+ (y2 -y)
                Weg(xL,yL) = Weg(xL, yL) + M(xK,yK)*(abs(xK - xL)+ abs(yK-yL));
                
                if (shortestW > Weg(xL,yL))
                    shortestW = Weg(xL, yL);
                    shortestX = xL;
                    shortestY = yL;
                end
            end
        end
    end
end

fprintf('Best Lager %d-%d', shortestX, shortestY);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 2
dataX = [0.5;1;1.5;2;2.5;3;3.5;4];
dataY=[6.7;2.8;1.3;0.77;0.46;0.23;0.19;0.16];
scatter(dataX, dataY, 'ob');
hold on;
f=fit(dataX, dataY, 'a*exp(b*x)', 'Startpoint', [0,0]);
hold on;
x=linspace(0,4,100);
plot(x,f(x), '-k');

beta = f.b;

startValue = f(0)
halb = log(2) / beta;
halbmin = halb * 60 * -1;
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Beispiel 3
opts = detectImportOptions('Insurance_9.csv');
data = readtable('Insurance_9.csv', opts);

%scatter(data.Cost, data.Age);
hold on;
fa = fit(data.Cost, data.Age, 'a+b*x', 'Startpoint', [0,0]);
%plot(fa);

data.male = double(contains(data.Sex, 'Male'));
f = fit([data.Age, data.male], data.Cost, 'a+b*x+c*y', 'Startpoint', [0,0,0]);
v = f([28,1]);
 plot(f);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
% 1)
n = 10^6;
a = randn(n,1) * 2;
b = randn(n,1) * 2;

res = sum(a.^2 + b.^2 >= 4)/n*100;

%%
% 2)
M = [7.25, 1.8, 2.12;
    1.43,21.75,0.52;
    1.4,1.0,13.25;
    0.98,0.74,0.04];
b= [579.67;336.2;889.66;70.79];

v = M\b;

%%
% 3)
x = [-15,-10,25,35];
y = [4.2, 4.6, 6.4, 6.2];
x_interp = [-15:35];
y_interp = spline(x,y,x_interp);
plot(x_interp, y_interp, '-r'); % <- a

res = interp1(x,y, 0) % <- b

%%
% 4)
format longG
g = 9.8065;
k = 0.00341;
y = @(t) (log(cosh(t*sqrt(g*k))))/k;
res = y(79)

%%
% 5)
dist=[49,55,48,58;
    24,54,54,45;
    53,60,52,30;
    48,58,36,58];

shortestDist = inf;
opt_lieferX = 1;
opt_lieferY = 1;

% Position Lagerhaus
for lieferX=1:4
    for lieferY=1:4
        temp_dist = 0;

        % Position Kunden
        for matrixX=1:4
            for matrixY=1:4
                temp_dist = temp_dist + (abs(matrixX-lieferX) + abs(matrixY - lieferY)) * dist(matrixY,matrixX);
            end
        end

        if temp_dist < shortestDist
            shortestDist = temp_dist;
            opt_lieferX = lieferX;
            opt_lieferY = lieferY;
        end
        
    end
end

fprintf("Die optimale Position für das Lagerhaus befindet sich bei (Y=%d, X=%d) mit einer Distanz von %d \n", opt_lieferY, opt_lieferX, shortestDist);

%%
% 6)
format longg
f = @(v) 1 + 9.*v(1) + 13.*v(2) - 5.*v(1).^2 - 10.*v(2).^2;
start = [1,1];
lb=[0,0];
ub=[2,1];
[v, opt]=fmincon(f,start, [], [], [], [], lb, ub);
x = v(1);
y = v(2);
disp(opt)

%%
format longg
f = @(v) 1 + 9.*v(1) + 13.*v(2) - 5.*v(1).^2 - 10.*v(2).^2;
max(x)
max(y)
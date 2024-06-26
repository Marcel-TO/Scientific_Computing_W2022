%%
% Aufgabe 1
for alpha=1:3
    f = @(x) exp(alpha*x);
    x=linspace(0,2,100);
    
    y=f(x);
    plot(x,y);
    hold on;
end
legend('f(x)=exp(x)', 'f(x)=exp(2*x)', 'f(x)=exp(3*x)');
%%
% Aufgabe 2
x=linspace(0,1,100);
y=linspace(0,1,100);

[X,Y] = meshgrid(x, y);
Z = sin(X .* 2*pi) .* sin(Y .* 3*pi);
mesh(X,Y,Z);
% contour(X,Y,Z, 100);
%%
% Aufgabe 3
x=linspace(0,1,100);
y=linspace(0,1,100);

[X,Y] = meshgrid(x,y);
axis([0 1 0 1]); % X,Y Axe Fixiert

% Frames erstellen
T=4;
fps=100;
for k=1:T*fps
    t=k/fps;
    Z = sin(2.*pi.*t) .* sin(2 .* pi .* X) .* sin(3 .* pi .* Y);
    mesh(X,Y,Z);
    zlim([-1 1]); % Z Axe Fixieren!!
    M(k)=getframe;
end

movie(M,fps);
%%
% Aufgabe 4
% a)
n = 10000;
x = randi(10, 1, n);
y = randi(10, 1, n);
resulta = sum(x.^2 + y.^2 >= 100)/n;

% b)
n = 10000;
x = rand(1, n);
y = rand(1, n);
resultb = sum(x.^2 + y.^2 >= 1)/n;

% c)
n = 10000;
x = randn(1, n);
y = randn(1, n);
resultc = sum(x.^2 + y.^2 >= 1)/n;
%%
% Aufgabe 5
M = [0.6,0.3,0.1;
    0.3,0.5,0.2;
    0.1,0.2,0.7];
Zustand = [0;1;0];

% a)
for i=1:3
    Zustand = M * Zustand;
end
disp(Zustand)

% b)
[v, la] = eig(M);
e = v(:,3);
disp(e)
e = e / sum(e);
disp(e)

%%
% Aufgabe 6
dist=[83,12,50,93,99;
    79,14,15,70,1;
    32,68,6,59,87;
    54,50,86,82,62;
    9,19,57,88,99];

shortestDist = inf;
opt_lieferX = 1;
opt_lieferY = 1;

% Position Lagerhaus
for lieferX=1:5
    for lieferY=1:5
        temp_dist = 0;

        % Position Kunden
        for matrixX=1:5
            for matrixY=1:5
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
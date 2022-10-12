%{
% Self-Check
% a)
v = [1:140];
res_a = sum(v.^3);
% disp(res_a)

% b)
res_b = 0;
for i=1:150
    res_b = res_b + cos(i);
end

% c)
g=9.8065;
k=0.00341;
t = 16;

res_c = (log(cosh(t*sqrt(g*k))))/k;

% d)
M = [16,55,46;
    66,11,56;
    26,61,62];
v = [12;44;8];
res_d = M \ v;

% e)
M = [10.25,1.38,1.55;
    0.52,3.0,0.78;
    1.0,1.85,8.50;
    0.75,1.0,1.0];
v = [278.02;231.34;633.23;129.07];
res_e = M \ v;

% f)
res_f = F_recursive(15);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Self-Check For-Loop
dist=[58,38,52,37;
    57,42,36,57;
    55,52,42,28;
    47,54,20,46];

start=[2;2];
result = 0;

for x=1:4
    for y=1:4
        result = result + (abs(x-start(1,1)) + abs(y - start(2,1))) * dist(y,x);
    end
end
disp(result)
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Anonyme Funktion
f = @(x) x.^2;
f(4)
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Plotten von Funktionen
f= @(x) 1+x.^2;
x=linspace(0,1,10);
y=f(x);
plot(x,y, '-b');

grid on;
axis equal;

% Plotbereich festlegen
xlim([0,1]);
ylim([0,2]);

% Achsen anzeigen
set(gca, 'XAxisLocation', 'origin', 'YAxisLocation', 'origin');
xlabel('X');
ylabel('Y');

% Titel und Legende
title('Plot');
legend('y=1+x^2');
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Kombinieren von Plots
hold on;
f2 = @(x) exp(x);
y2=f2(x);
plot(x,y2);

title('2 Plots');
legend('y=1+x^2', 'y=e^x');
hold off;
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Implizite Plots
% Kreis

f = @(x,y) x.^2+y.^2 - 1;
fimplicit(f, [-1 1 -1 1]);

%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Plotten von Funktionen z=f(x,y)
x=linspace(-1,1,100);
y=linspace(-1,1,100);

[X Y] = meshgrid(x, y);
Z = X.^2 + Y.^2; % z=x^2+y^2
mesh(X,Y,Z);
% surf(X,Y,Z); % Alternative Darstellung

% Höhenlinien - Contourdiagram
% contour(X,Y,Z, 100);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Animationen
x=linspace(0,1,100);
axis([0 1 -1 1]);

% Frames erstellen
T=4;
fps=30;
for k=1:T*fps
    t=k/fps;
    y=sin(2*pi*(x+t));
    plot(x,y);
    M(k)=getframe;
end

movie(M,fps);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{

%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{

%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
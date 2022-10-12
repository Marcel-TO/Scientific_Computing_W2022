%{
x = 1;

if x>0
    fprintf('Die Zahl %d ist positiv\n', x);
end


for i=1:10
    fprintf('Wir befinden uns im for-loop bei i=%d\n', i);
end

i=0;
while i<10
    i=i+1;
    fprintf('Wir befinden uns in der while-loop bei i=%d\n', i)
end
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
t=0; %Random Walk selbst
x=0;
n=100;
random=randi(0:1,1,n);
r=sum(random);
l=r-n;
a = x+r+l;
fprintf('%d\n',a);

steps = randsample([-1,1], 100, 1); %Random Walk short example
pos = sum(steps);
fprintf('%d\n',pos);
%


n=1000000;
counter=0;
for i=1:n
    steps = randsample([-1,1], 100, 1);
    pos = sum(steps);
    
    if pos < 10 && pos > -10
        counter = counter + 1;
    end
end

w=(counter / n) * 100; % Wahrscheinlichkeit, mit welcher der Abstand kleiner als 10 ist
fprintf('%d\n', w);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
%PLOT
f=@(x) 1+x.^2;
x=linspace(0,1,10);
y=f(x);
plot(x,y)
plot(x,y,'-b')
plot(x,y,'ob')
%
grid on;
axis equal;
xlim([-2,2]);
ylim([-2,2]);

set(gca, 'XAxisLocation', 'origin', 'YAxisLocation', 'origin');
xlabel('x');
ylabel('y');

title('Plot');
legend('y=1+x^2');

hold on; % Plot hinzufügen
f=@(x,y) x.^2+y.^2-1;
fimplicit(f, [-1 1 -1 1]);


x=linspace(-1,1,100); y=linspace(-1,1,100); %Rotate 3D Tool nutzen und Ziehen
[X Y]=meshgrid(x, y);
Z=X.^2 + Y.^2;
mesh(X,Y,Z);
surf(X,Y,Z);
contour(X,Y,Z);
contour(X,Y,Z,100);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
%Animation (sin funktion)
x=linspace(0,1,100);
axis([0 1 -1 1]);
T=4;
fps=60;
for k=1:T*fps
    t=k/fps;
    y=sin(2*pi*(x+t));
    plot(x, y);
    M(k)=getframe;
end

movie(M, fps);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
%Weitere Wahrscheinlichkeiten
b = poissrnd(10, 1, 8);
cumsum(b);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Räumliche Poisson-Verteilungen
len=2;
la=8;
N=poissrnd(len*la,1,1);
x=rand(1,N)*len;
scatter(x*0,x); %muss 2 Vektoren enthalten -> 1 Vektor wurde 0 gesetzt, damit verteilung angezeigt wird.

height=2;
width=3;
la=8;
N=poissrnd(height*width*la,1,1);
x=rand(1,N)*width;
y=rand(1,N)*height;
scatter(x,y);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
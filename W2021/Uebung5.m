%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 1
x=linspace(0,1,100);
y=linspace(0,1,100);
z=@(x,y) sin(x.*2*pi).*sin(y.*2*pi);

[X, Y]=meshgrid(x,y);
Z = z(X,Y);
mesh(X,Y,Z);
%contour(X,Y,Z);

%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 2
x=linspace(0,1,100);
y=linspace(0,1,100);
T = 1;

fps = 100;
for k=1:T*fps
    t=k/fps;
    z=sin(2*pi.*t).*sin(2*pi.*x).*sin(3*pi.*y);
    [X,Y]=meshgrid(x,y);
    Z=sin(2*pi.*t).*sin(2*pi.*X).*sin(3*pi.*Y); % Irgendein Matlab fehler....
    mesh(X,Y,Z);
    M(k)=getframe;
end

axis([0 1 0 1 -1 1]);
movie(M,fps);

    

%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 3
syms x
a = solve(2==exp(x^2));
resultA = double(a);

b = solve(2==x*exp(x^2));
resultB = double(b);

syms p
p = 5/(b-1)-(6*b)/(b^2 - 1)-(1-2*b)/(b+b^2);
simplify(p)

syms f(x)
f(x) = cos(x) * exp(x^2);
test = diff(f,x);

int(f,x,0,1);
int(f,x,-inf,inf);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 4
m1=[0,150,80,inf,90;
    150,0,100,125,100;
    80,100,0,60,125;
    inf,125,50,0,100;
    90,100,125,100,0];

m2=perms(1:5);
optimum=inf;

for i=1:120  %Scheinbar irgendwo Fehler bei for loop :(
    res = 0;
    for n=1:5
        if (n < 5)
            res = res + m1(m2(i,n), m2(i,n+1));
        else
            res = res+m1(m2(i,5),m2(1,1));
        end
        
        
    end
    
    if (res < optimum)
        optimum = res;
        optiweg = m2(i,:);
    end
end

fprintf('Der optimale Weg ist %d-%d-%d-%d-%d und hat eine Distanz von %d', optimum, optiweg);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Beispiel 5
M=[83, 12, 50, 93, 99;
   79, 14, 15, 70, 1;
   32, 68, 6, 59, 87;
   54, 50, 86, 82, 62;
   9, 19, 57, 88, 99];

Weg = zeros(5,5);
shortestW=inf;
shortestX=0;
shortestY=0;

for xL=1:5
    for yL=1:5
        distance = 0;
        
        for xK=1:5
            for yK=1:5                              % Manhatten Distanz (x2 - y)+ (y2 -y)
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
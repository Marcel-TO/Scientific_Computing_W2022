%Selfcheck multivariat constrained

f=@(x,y) 4 + 3.*x + 5.*y + 4.*x^2 + 6.*y^2 + 2.*x^3 + 2.*y^3;
g=@(v) f(v(1),v(2)) * -1;

x=linspace(-1,1,100);
y=linspace(-1,1,100);
[X Y]=meshgrid(x,y);
Z=f(X,Y);
contour(X,Y,Z,100);

[v,opt] = fmincon(g,[1,1],[],[],[],[],[],[],@constrained)






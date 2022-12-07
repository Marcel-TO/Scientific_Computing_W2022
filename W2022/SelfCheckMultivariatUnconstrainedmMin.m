%SelfCheck multivariat unconstrained

f=@(x,y) 2.*x^4 - 4.*x^3 + 3.*x^2*y - 16.*x^2 - 5.*x*y^2 - 12.*y^2 + 3.*y^3 + 2.*y^4 + 3
g=@(v) f(v(1),v(2));

x=linspace(-1,4,100);
y=linspace(-1,3,100);
[X Y]=meshgrid(x,y);
Z=f(X,Y);
contour(X,Y,Z,100)

[v,opt] = fminunc(g,[0.5,1])
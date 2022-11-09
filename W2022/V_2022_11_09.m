%%
% Constraints -> confun.m

f = @(v) pi.*v(1).*(2.*v(2)+sqrt(v(3).^2+v(1).^2)) %v(1)=r, v(2)=h, v(3)=b
[v, opt] = fmincon(f,[1,1,1], [], [], [], [], [], [], @confun);
r_min=v(1);
h_min=v(2);
b_min=v(3);

%%
% Curve-Fitting: Linear

datax=[1;2;3;4];
datay=[1.0;3.2;1.5;4.0];
scatter(datax,datay,'ob');

f=fit(datax,datay,'a*x+b');

hold on;
x=linspace(0,6,100);
plot(x,f(x), '-k');
%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 1
function x=fib_rekursiv(n)
    if n > 2
        x = fib_rekursiv(n-2) + fib_rekursiv(n-1);
        return
    else
        x = 1;
        return
    end
end
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 2
x = linspace(0,1,100);
y=fs(x, 0);
plot(x,y)
hold on;

x = linspace(0,1,100);
y=fs(x, 0.1);
plot(x,y)
hold on;

x = linspace(0,1,100);
y=fs(x, 0.2);
plot(x,y)
hold on;

axis([0 1 -1 1]);
grid on;
title('Schwingende Saite');
legend('t=0','t=0.1','t=0.2');
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 3
x=linspace(-1,3,100); y=linspace(-1,3,100);
[X, Y]=meshgrid(x, y);
Z = 4*X.^3 - 12*X.^2 + 3*X.*Y.^2 + 1; % bei X*Y vllt X.*Y ??
mesh(X,Y,Z);
%contour(X,Y,Z, 100);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 4
% a)
n=1000;
ma = max(exprnd(1,1,n), exprnd(2,1,n));
pa = sum(ma) / n;

%b)
n=1000;
ma = max(exprnd(1,1,n), exprnd(2,1,n));
pb = sum(ma) / n;
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 5
% a)
n= 100000;
lambdaM = 18;
lambdaS = lambdaM / 60;
r = poissrnd(lambdaS * 2, 1, n);
sa = sum(r==0) /n*100;

% b)
n= 100000;
lambdaM = 18;
lambdaS = lambdaM / 60;
r = poissrnd(lambdaS * 4, 1, n);
sb = sum(r==0) /n*100;
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 6
n=1000;
pa = exprnd(1,1,n);
pb = exprnd(2,1,n);

counter = 0;

for i=1:n
    v(i) = poissrnd(pa(i),1,1);

    if (v(i) >= 2 && pb(i) > pa(i))
        counter = counter + 1;
        continue;
    end

    if (v(i) == 0 && pb(i) > pa(i) && poissrnd(pb(i) - pa(i),1,1) >= 1)
        counter = counter + 1;
        continue;
    end

    if (v(i) == 1 && poissrnd(pb(i) - pa(i),1,1) >= 1 && pb(i) > pa(i))
        counter = counter + 1;
        continue;
    end

    if (pb(i) < pa(i) && poissrnd(pb(i),1,1) >= 2)
        counter = counter + 1;
        continue;
    end
end

result = counter/n*100;
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
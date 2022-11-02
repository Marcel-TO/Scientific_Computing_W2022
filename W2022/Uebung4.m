%%
% Aufgabe 1
% a)
syms x;
sol = solve(exp(x^2)-2==0);
a = double(sol);

% b)
syms x;
sol = solve(x*exp(x^2)-2==0);
b = double(sol);

% c)
syms b;
c = (5/(b-1)) - ((6*b)/(b^2 - 1)) - ((1-2*b)/(b+b^2));

% d)
syms x;
f(x) = cos(x) * exp(x^2);

% f)
syms x;
f(x) = exp(-x^2);
erg = int(f,x, 0, 1);
e = double(erg);

% g)
syms x;
f(x) = exp(-x^2);
erg = int(f,x, -inf, inf);
f = double(erg);

%%
% Aufgabe 2 Poissrnd Nieren -> Siehe W2021/Uebung4.m
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

%%
% Aufgabe 3
la = 18/60;
n = 10^6;
poA = poissrnd(la*2, 1, n);
solA = mean(poA < 1);

poB = poissrnd(la*4, 1, n);
solB = mean(poB < 1);

%%
% Aufgabe 4 Poissrnd Nieren -> Siehe W2021/Uebung4.m
% a)
n=1000;
ma = max(exprnd(1,1,n), exprnd(2,1,n));
pa = sum(ma) / n;

%b)
n=1000;
ma = max(exprnd(1,1,n), exprnd(2,1,n));
pb = sum(ma) / n;
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

    % Nieren für beide Patienten vorhanden.
    if (v(i) >= 2 && pb(i) > pa(i))
        counter = counter + 1;
        continue;
    end

    % In Lebenszeit von A kommt keine Niere -> Kommt in Lebenszeit von B
    % eine wird dann geschaut.
    if (v(i) == 0 && pb(i) > pa(i) && poissrnd(pb(i) - pa(i),1,1) >= 1)
        counter = counter + 1;
        continue;
    end

    % Lebenszeit von B ist kürzer als a und wie hoch ist die
    % Wahrscheinlichkeit das 2 Nieren in dieser Zeit kommen.
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
% Aufgabe 4
n=10^6;
leb = [exprnd(1,1,n);exprnd(2,1,n)];
resA = mean(max(leb));
resB = mean(min(leb));

%%
% Aufgabe 5
gewichte = [3,7,4,12,8,10,9,14,10,12];
werte = [3,5,2,11,4,6,2,15,12,9];

wertMax = 0;
temp = 0;
bestObj = [];

for i=1:10
    pos = nchoosek(1:10,i);
    low60pos = pos .* (sum(gewichte(pos), 2) <= 60);
    low60pos(~any(low60pos,2),:) = [];
    
    for j=1:size(low60pos,1)
        temp = sum(werte(low60pos(j,:)));
        if (temp >= wertMax)
            wertMax = temp;
            bestObj = low60pos(i,:);
        end
    end
end
%%
% Frage 1
res_1 = 0;
for i=1:150
    res_1 = res_1 + cos(i);
end

disp(res_1)

%%
% Frage 2
n = 10^6;
a = randi(70,1,n);
b = randi(70,1,n);
res = sum(a+b >= 50)/n*100;

%%
% Frage 3
format longg;
F_recursive(12)

%%
% Frage 4
format longG
g = 9.8065;
k = 0.00341;
y = @(t) (log(cosh(t*sqrt(g*k))))/k;
res = y(19)

%%
% Frage 5
M = [41,77,59;
    38,13,29;
    69,19,43];
v = [63;83;61];

b = M\v;

%%
% Frage 6
f = @(x) 4 + (5/6).*x - 3.*x.^2 + x.^3;
x=linspace(0,3,100);
y=f(x);
plot(x,y);
max = max(y);
hold on;
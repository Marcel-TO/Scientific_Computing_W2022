%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 1
x=linspace(0.1,10,100);
y=linspace(0.1,10,100);
[X,Y]=meshgrid(x,y);
Z=1+(1./X)+(10./X)+(3.*X)+(4.*Y);
mesh(X,Y,Z);
f = @(v) 1 + (1./v(1)) + (10./(v(2))) + (3.*v(1)) + (4.*v(2));
fminunc(f, [0.1,10]);

%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Beispiel 2
lb = zeros(1,4);
lb(3) = 400;
ub = [];
f = [1,1,1,1];
A = [2,3,4,5; 3,4,5,6;15,10,9,7];
b = [3300; 4000; 12000];

res = linprog(-f,A,b,[],[],lb, ub);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 3
f = [10,30.5,90];

A = [0.38,0.001,0.002; % A *x <=
    -0.38,-0.001,-0.002; %  >= dann muss ich minus setzten:
    -0,-0.09,-0.5;
    -0,-0.02,-0.08];

b = [1.2/100*1000; %+ weil maximum
    -0.8/100*1000; %- weil mindestens
    -22/100*1000;
    -5/100*1000];

Aeq = [1,1,1];
beq = [1000];

res = linprog(f,A,b,Aeq,beq);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 4
f = @(v) v(1).^2 + 4.*v(1).*(v2);
[v, opt] = fmincon(f, [1,1], [], [], [], [], [], [], @constr);

function [c, ceq] = constr(v)
    c = [];
    ceq = [v(1).^2 .* v(2)] - 1;
end
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Beispiel 5
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
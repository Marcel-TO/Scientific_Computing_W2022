%%
% Aufgabe 1
f = -[1 1 1 1]; % Das minus ist, weil man das Maximium will.
A = [2 3 4 5; 3 4 5 6; 15 10 9 7];
b = [3300; 4000; 12000];
Aeq = [];
beq = [];
lb = [0 0 400 0];
ub = [];
linprog(f, A, b, Aeq, beq, lb, ub)

%%
% Aufgabe 2
f = -[10 6 5]; % Das minus ist, weil man das maximum will.
A = [10 4 5; 3 2 1; 1 2 1];
b = [2300; 700; 450];
Aeq = [];
beq = [];
lb = [0 0 0];
ub = [];
linprog(f, A, b, Aeq, beq, lb, ub)

%%
% Aufgabe 3
f = [8 25 80];
A = [0.38 0.001 0.002; -0.38 -0.001 -0.002; 0 -0.09 -0.5; 0 -0.02 -0.08];
b = [0.01; -0.008; -0.18; -0.03];
Aeq = [1 1 1];
beq = [1];
lb = [];
ub = [];
[v, opt] = linprog(f,A,b,Aeq,beq,lb,ub)
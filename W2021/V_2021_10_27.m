% Normalerweise NICHT symbolisch rechnen!

%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Normalerweise
x=0.362;
y=36.2;
res = 100*x == y; % Wirft false, weil Computer falsch rundet
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Numerische Überprüfung immer mit Fehlertoleranz
res = abs(100*x-y)<10^(-6);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
syms x;
a = solve(x^2-2==0,x);
sol = double(a);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
syms x y;
solutions = solve([x^2==2, y==0], [x,y]);
sol = [solutions.x solutions.y];
sol_num = double(sol);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Vereinfachen
syms x;
p = (x^2-1)/(x-1);
ps = simplify(p);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Substituieren
syms x;
p=x^2-1;
s1 = subs(p,x,1);
s2 = subs(p,x,sym(sqrt(2)));
%}
%%%%%%%%%%%%%%%%%%%%%%
%{
% Symbolische Funktionen
x=[0:4];
y = x.^2;
syms x;
f(x)=x^2;

f([0:4]);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Symbolische Differentation
f(x) = x^2;
diff(f, x);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
syms x y;
f(x,y) = 1+ x^2 + y^2; % Brauchen keinen Punkt weil Symbolisch.
test = diff(f,x);
%}
%%%%%%%%%%%%%%%%%%%%%%
%{
f(x)=x^2;
int(f,x);
t = int(f,x,0,1);
d = double(t);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% NEXT TOPIC
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Permutation (mögliche Anordnungen von Zahlen)
perms(1:5);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Beispiel Traveling Salesman -> 5 Orte mit unterschiedlichen Entfernungen
% -> schnellste Route Suchen


dist=[0,150,80,0,90;150,0,100,125,100;80,100,0,50,125;0,125,50,0,100;90,100,125,100,0];
start=[dist(1), dist(6), dist(11), dist(16), dist(21)];


for a=1:25
    if (dist(a) ~= 0)
        for b=1:25
            if (dist(b) ~= dist(a) && dist(b) ~= 0)
                 for c=1:25
                     if (dist(c) ~= dist(a) && dist(c) ~= dist(b) && dist(c) ~= 0)
                        for d=1:25
                            if (dist(d) ~= dist(a) && dist(d) ~= dist(b) && dist(d) ~= dist(c) && dist(d) ~= 0)
                                for e=1:25
                                    if (dist(e) ~= dist(a) && dist(e) ~= dist(b) && dist(e) ~= dist(c) && dist(e) ~= dist(d) && dist(e) ~= 0)
                                    s = [dist(a), dist(b), dist(c), dist(d), dist(e)];

                                      if (sum(s) < sum(start))
                                          start = s;
                                          continue;
                                      end
                                    end
                                end
                            end
                        end
                     end
                 end
            end
        end
    end
end

distance = sum(s);


%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
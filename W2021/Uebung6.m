%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 1
% a
format shortg
g=9.81;
k=0.0034;
f = @(t) log(cosh(t.*sqrt(g.*k))) ./ k;
t = linspace(0,8,80);
y=f(t);
plot(t,y);

% b
f = @(t) (log(cosh(t.*sqrt(g.*k))) ./ k)-60;
fsolve(f,1);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 2
f = @(x) exp(x.^2)-2^x;
fplot(f, [-0.5, 1]);
grid on;
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 3
f = @(x,y) 4*x.^3-12*x.^2+3*x.*y.^2 + 1;
x = linspace(-2,3,100);
y = x;
[X, Y] = meshgrid(x,y);
Z = f(X,Y);
mesh(X,Y,Z);
% contour(X,Y,Z);

% Minimum Values
f = @(v) 4*v(1).^3-12*v(1).^2+3*v(1).*v(2).^2 + 1;
fminunc(f, [1,1]);
% contour(X,Y,Z, 100);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 4
% function confun erstellt -> Siehe confun.m -> Uebung6-Beispiel 4

f = @(v) v(1)+v(2).*20;
[v, opt]=fmincon(f,[1, 1],[],[],[],[],[],[],@confun)
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 5
t = [1,2,3,6,1*12,2*12,3*12,5*12,7*12,10*12,20*12,30*12];
z = [1.55,1.57,1.57,1.56,1.54,1.61,1.62,1.66,1.67,1.82,2.11,2.26];
plot(t,x, 'ob');

t_interp = [1:30*12];
z_interp = interp1(t, z, t_interp);
plot(t_interp, z_interp);
hold on;
z_spline = spline(t, z, t_interp);
plot (t_interp, z_spline);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Beispiel 6
G = [3, 7, 4, 12, 8, 10, 9, 14, 10, 12];
W = [3, 5, 2, 11, 4, 6, 2, 15, 12, 9];

optG = Inf;
maxW = 0;
optSelection = [];

for a = 1:9
    % Alle potentiellen Möglichkeiten
    v = nchoosek([1:10], a);
    
    for i = 1:length(v)
        row = v(i, :);
        sumG = sum(G(row));
        sumW = sum(W(row));
        
        if (sumG <= 60)
            if (maxW < sumW)
                optG = sumG;
                maxW = sumW;
                optSelection = row;
            end
        end
    end
end

fprintf('Optimum G: %d \n', optG);
fprintf('Maximum W: %d \n', maxW);
fprintf('Optimal Selection:');
fprintf('%d %d %d %d %d %d %d %d %d %d', optSelection);
fprintf('\n');
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
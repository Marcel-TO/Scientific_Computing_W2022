%{
function y=f(x) %Kann auch in Console -> f = @(x) x.^2 (anonyme function)
    y=x.^2;
end
%

function z=f(x,y) % Console -> f = @(x,y) x+y
    z=x+y;
end
%

function z=f(v) % Console -> f = @(v) v(1) + v(2)
    z=v(1) + v(2);
end
%

function [a,b]=f(x,y)
    a=x+y; b=x-y;
end
%}
function [c,ceq] = constraint(v)

c = [];
ceq = [v(1).^2 + v(2).^2 - 1];
end
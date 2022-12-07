function [c, ceq] = confunKarton(v)
% Nicht-lineare Ungleichung:
c = [];
% Nicht-lineare Gleichung:
ceq = [v(1).^2 * v(2) - 4];
end
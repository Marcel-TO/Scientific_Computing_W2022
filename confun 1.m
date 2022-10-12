%{
% linearer Constraint:
function [c, ceq] = confun(v)
    % Nicht-lineare Ungleichung:
    c = [(v(1)-1)^2+(v(2)-1)^2-0.1^2];
    % Nicht-lineare Gleichung:
    ceq = [];
end
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Nicht-linearer Constraint:
function [c, ceq] = confun(v)
    % Nicht-lineare Ungleichung:
    c = [];
    % Nicht-lineare Gleichung:
    ceq = [v(1).^2+v(2).^2-2];
end
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Uebung6-Beispiel 4
function [c, ceq] = confun(v)
    % Nicht-lineare Ungleichung:
    c = [];
    % Nicht-lineare Gleichung:
    ceq = [sqrt(v(1)) + v(2) - 50];
end
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% V_2021_11_10  Lagerhaus -> Beispiel E
function [c, ceq] = confun(v)
    % Nicht-lineare Ungleichung:
    c = [(v(1)-1).^2+(v(2)-1).^2-0.5^2];
    % Nicht-lineare Gleichung:
    ceq = [];
end
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
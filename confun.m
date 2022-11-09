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
%
% Nicht-linearer Constraint:
function [c, ceq] = confun(v)
    % Nicht-lineare Ungleichung:
    c = [];
    % Nicht-lineare Gleichung:
    ceq = [pi.*v(1).^2.*((v(3)./3)+v(2))-1];
end
%}
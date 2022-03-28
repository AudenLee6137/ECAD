function [c,ceq] = ga_con(p)
LB = [0 0];
UB = [1 1];

s = LB + p.*(UB - LB);

% c = [abs(mod(s(3),1)) - 1e-6];
c = [];
ceq = [];
% c = [abs(mod(s(1),2))-1e-6;
%     abs(mod(s(2),1))-1e-6];
% ceq = [mod(s(4),1)];

end
function [c ceq] = DO_con(x,fun1_t,fun2_t,fun3_t,fun4_t)

load LB.mat
load UB.mat

s = LB + x.*(UB-LB);




fun1 = Torque(x); 
fun2 = Power(x); 
fun3 = Maximum_current(x); 
fun4 = Current_density(x);






c = [
%     fun1 - fun1_t; % fun1�� target���� �۾ƾ���
%     fun1_t - fun1; % fun1�� target���� Ŀ����
     fun1_t - fun1;
     fun2_t - fun2;
     fun3 - fun3_t;
     fun4 - fun4_t;
%      abs(mod(fun7,1)) - 1e-6;
     ];

ceq = [];

end

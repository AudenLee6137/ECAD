% Design Optimization

clear all; close all; clc;

%% 입력 %%
% 설계 변수 최대/ 최소 입력 (x1, x2, x3)
LB = [110 14]; % 설계변수 최솟값 [x1, x2, x3] 순서
UB = [220 40]; % 설계변수 최댓값 [x1, x2, x3] 순서
save LB.mat LB
save UB.mat UB

% 제한 조건
fun1_t = 119.5; %%토크
fun2_t = 29999; %%파워
fun3_t = 400; %%전류
fun4_t = 12;  %%전류밀도





OPT_results = [];

load x_initial.mat
%% Optimization
for i = 1:20
lb = [0,0]; % Optimization domain내 설계변수 최솟값 [x1, x2, x3, x4, x5] 순서
ub = [1,1]; % Optimization domain내 설계변수 최댓값 [x1, x2, x3, x4, x5] 순서

x0 = x_initial(i,:); % Initial design

options = optimoptions(@fmincon,'Algorithm','sqp','Display','iter','MaxIterations',2000,'MaxFunctionEvaluations',2000,'StepTolerance',1e-6,'OptimalityTolerance',1e-6);
[DO_x,DO_fval,DO_exitflag,DO_output] = fmincon(@(x) DO_obj(x),x0,[],[],[],[],lb,ub,@(x) DO_con(x,fun1_t,fun2_t,fun3_t,fun4_t),options);

%% Optimum point
RDO1_xopt = [LB+DO_x.*(UB-LB)]; % optimum design point

fun1_opt = Torque(DO_x);  
fun2_opt = Power(DO_x); 
fun3_opt = Maximum_current(DO_x); 
fun4_opt = Current_density(DO_x); 


RDO1_yopt = [fun1_opt;fun2_opt;fun3_opt;fun4_opt]';



OPT_results = [OPT_results; RDO1_xopt, RDO1_yopt, DO_exitflag];
end


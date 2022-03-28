clear all; clc; close all;

load S.mat
load Y.mat

% %diff
% errors_Y1_0_diff = crossvalidation(S,Y,'diff','0')  % zeroth order
% % errors_Y1_1_diff = crossvalidation(S,Y,'diff','1')  % first order
% % errors_Y1_2_diff = crossvalidation(S,Y,'diff','2')  % second order
errors_Y1_0_mean = kfoldcv(S,Y,'mean','0',5)  % zeroth order

string_opt_result = "errors_Y1_0_mean.dat";

save(string_opt_result, "errors_Y1_0_mean", "-ascii");

% Mean
% errors_Y1_0_mean = loocv(S,Y,'mean','0')  % zeroth order
% errors_Y1_0_mean = kfoldcv(S,Y,'mean','0',8)  % zeroth order
% errors_Y1_1_mean = crossvalidation(S,Y,'mean','1')  % first order
% errors_Y1_2_mean = crossvalidation(S,Y,'mean','2')  % second order

% % Max
% errors_Y1_0_max = crossvalidation(S,Y,'maxi','0')  % zeroth order
% % errors_Y1_1_max = crossvalidation(S,Y,'maxi','1')  % first order
% % errors_Y1_2_max = crossvalidation(S,Y,'maxi','2')  % second order
clear all; clc; close all;

load S.mat
load Y.mat

errors_Y1_0_diff = crossvalidation(S,Y,'diff','0')  % zeroth order
% errors_Y1_1_diff = crossvalidation(S,Y,'diff','1')  % first order
% errors_Y1_2_diff = crossvalidation(S,Y,'diff','2')  % second order

% Mean
errors_Y1_0_mean = crossvalidation(S,Y,'mean','0')  % zeroth order
% errors_Y1_1_mean = crossvalidation(S,Y,'mean','1')  % first order
% errors_Y1_2_mean = crossvalidation(S,Y,'mean','2')  % second order

% Max
errors_Y1_0_max = crossvalidation(S,Y,'maxi','0')  % zeroth order
% errors_Y1_1_max = crossvalidation(S,Y,'maxi','1')  % first order
% errors_Y1_2_max = crossvalidation(S,Y,'maxi','2')  % second order



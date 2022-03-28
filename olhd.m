% run olhd sampling
% 
% 2020.05
% Optimum Design Lab.
% Saekyeol Kim, Ph.D. candidate in Hanyang university
% Adviser Professor Tae Hee Lee

clear all; clc; close all; format long;

% nv: number of variables
nv = 2;

% n_olhd: number of olhd samples
% n_olhd = (nv+1)*(nv+2)/2*nv*5;

% n_olhd = (nv+1)*(nv+2);

n_olhd = 40;

% sampling using lhsdesign
x_initial = lhsdesign(n_olhd,nv,'smooth','off','criterion','maximin','iterations',1000);

% save olhd data set   
savefile = 'x_initial.mat'; save(savefile, 'x_initial');



clear all; clc; close all; format long;

%% nv: number of variables
nv = 2;

%% n_olhd: number of olhd samples
% n_olhd = (nv+1)*(nv+2)/2;
n_olhd = 100;

% sampling using lhsdesign
x_olhd = lhsdesign(n_olhd,nv,'smooth','off','criterion','maximin','iterations',1000);

% save olhd data set   
savefile = 'x_olhd.mat'; save(savefile, 'x_olhd');

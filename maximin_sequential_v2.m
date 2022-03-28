

clear all; clc; close all; format long;

% nv: number of variables
nv = 2;

bound = [0 1].*ones(nv,1);
lb = bound(:,1); ub = bound(:,2);

% n_maximin: number of maximin samples (일반적으로 OLHS와 동일한 개수)
n_maximin = 20;

% load OLHD data
load x_olhd;
x = x_olhd;

% n_olhd: number of olhd samples
n_olhd = length(x_olhd);

% sampling using GA
% population: 1000
% generation: 2000

for i=1:n_maximin
    % ns: current number of samples
    ns = n_olhd+(i-1);
    options_ga = optimoptions('ga','populationsize',1000,'maxgenerations',2000,'functiontolerance',1e-6,'display','iter');
    [x_ga,fval_ga,exit,output] = ga(@(p) distance(p,nv,ns,x),nv,[],[],[],[],lb,ub,@(p) ga_con(p),options_ga)
    x_maximin(i,:) = x_ga(1,:);
    x(ns+1,:) = x_ga(1,:); 
end

% save new data set   
savefile = 'x.mat'; save(savefile, 'x');
savefile = 'x_maximin.mat'; save(savefile, 'x_maximin');

% distance calculation function
function obj = distance(p,nv,ns,x)
dist = zeros(1,ns);
count = 1;
for i = 1:ns
    tempdist = 0;
    for j = 1:nv
        tempdist = tempdist + (p(j)-x(i,j))^2;
    end
    tempdist = sqrt(tempdist);
    dist(1,count) = tempdist;
    count = count+1;
end
mindist = min(dist);
obj = -mindist;
end


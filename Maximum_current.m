function g3 = Maximum_current(x)
load LB.mat
load UB.mat
load Maxcurrent_dmodel.mat

s = LB+x.*(UB-LB);

g3 = predictor([s], Maxcurrent_dmodel);

end
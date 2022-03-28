function g2 = Power(x)
load LB.mat
load UB.mat
load Power_dmodel.mat

s = LB+x.*(UB-LB);

g2 = predictor([s], Power_dmodel);

end
function g4 = Current_density(x)
load LB.mat
load UB.mat
load Currentdensity_dmodel.mat

s = LB+x.*(UB-LB);

g4 = predictor([s], Currentdensity_dmodel);

end
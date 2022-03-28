function g1 = Torque(x)
load LB.mat
load UB.mat
load Trq_dmodel.mat

s = LB+x.*(UB-LB);

g1 = predictor([s], Trq_dmodel);

end
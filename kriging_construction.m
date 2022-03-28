

% kriging
theta0 = [1 1];
lob = [1e-2 1e-2];
upb = [10 10];

load S.mat % ���躯�� ���
load Y.mat % ���� ���

[Trq_dmodel, Trq_perf] = dacefit(S, Y(:,1), @regpoly0, @corrgauss, theta0, lob, upb);
[Power_dmodel, Power_perf] = dacefit(S, Y(:,2), @regpoly0, @corrgauss, theta0, lob, upb);
[Maxcurrent_dmodel, Maxcurrent_perf] = dacefit(S, Y(:,3), @regpoly0, @corrgauss, theta0, lob, upb);
[Currentdensity_dmodel, currentdensity_perf] = dacefit(S, Y(:,4), @regpoly0, @corrgauss, theta0, lob, upb);

save Trq_dmodel.mat Trq_dmodel
save Power_dmodel.mat Power_dmodel
save Maxcurrent_dmodel.mat Maxcurrent_dmodel
save Currentdensity_dmodel.mat Currentdensity_dmodel

function [errors] = crossvalidation(S,Y,type,regorder)
[ns,nr] = size(Y);
nd = size(S,2);

theta = 1*ones(1,nd);
lob = 1e-2*ones(1,nd);
upb = 20*ones(1,nd);

errors = zeros(1,nr);

for j = 1:nr
    Yj = Y(:,j);
    maxj = max(Yj);
    minj = min(Yj);
    meanj = mean(Yj);
    errj = 0;
    for i = 1:ns
        S_temp = S;
        S_temp(i,:) = [];
        Y_temp = Yj;
        Y_temp(i,:) = [];
        eval(['[krg_temp,perf] = dacefit(S_temp,Y_temp,@regpoly' num2str(regorder) ',@corrgauss,theta,lob,upb);']);
        Y_hat = predictor(S(i,:),krg_temp);
        Y_true = Yj(i);
        errj = errj + (Y_hat - Y_true)^2;
    end
    if type(1:4) == 'diff'
        errors(j) = (sqrt(errj/ns))/(maxj-minj);
    elseif type(1:4) == 'mean'
        errors(j) = (sqrt(errj/ns))/(meanj);
    elseif type(1:4) == 'maxi'
        errors(j) = (sqrt(errj/ns))/(maxj);
    else
        error('Please select normalization type: ''difference'' or ''mean'' or ''max''');
    end
end

end
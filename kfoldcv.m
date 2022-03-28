function [errors] = kfoldcv(S,Y,type,regorder,nfold)
[ns,nr] = size(Y);
nd = size(S,2);

theta = 1*ones(1,nd);
lob = 1e-2*ones(1,nd);
upb = 10*ones(1,nd);

errors = zeros(1,nr);

for j = 1:nr
    Yj = Y(:,j);
    maxj = max(Yj);
    minj = min(Yj);
    meanj = mean(Yj);
    errj = 0;
    for i = 1:nfold
        S_temp = S;
        if i == nfold
            ix1 = ceil(ns / (nfold)) * (i - 1) + 1;
            ix2 = ns;
        else
            ix1 = ceil(ns / (nfold)) * (i - 1) + 1;
            ix2 = ceil(ns / (nfold)) * i;
        end
        S_temp(ix1:ix2,:) = [];
        Y_temp = Yj;
        Y_temp(ix1:ix2,:) = [];
        eval(['[krg_temp,perf] = dacefit(S_temp,Y_temp,@regpoly' num2str(regorder) ',@corrgauss,theta,lob,upb);']);
        Y_hat = predictor(S(ix1:ix2,:),krg_temp);
        Y_true = Yj(ix1:ix2);
        errj = errj + mean((Y_hat - Y_true).^2);
    end
    if type(1:4) == 'diff'
        errors(j) = sqrt(errj/nfold)/(maxj-minj);
    elseif type(1:4) == 'mean'
        errors(j) = sqrt(errj/nfold)/(meanj);
    elseif type(1:4) == 'maxi'
        errors(j) = sqrt(errj/nfold)/(maxj);
    else
        error('Please select normalization type: ''difference'' or ''mean'' or ''max''');
    end
end

end
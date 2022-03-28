function obj = DO_obj(x)


fun5 = x(1); %%적층길이
fun3 = Maximum_current(x);
fun4 = Current_density(x);


% Objective function

obj = fun5;


end
% Author: Joel Glemne
function v = variance(tInterval,orig_var)

Ct = 1/(1-erfc(tInterval/sqrt(2*orig_var)));
v=orig_var*(1-Ct*(2*tInterval/sqrt(2*pi*orig_var)*exp(-tInterval^2/(2*orig_var))));

return
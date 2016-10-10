function v = gamfun(low,z)

fun = @(value) value.^(z-1).*exp(-value);
v = integral(fun,low,1000000);
return
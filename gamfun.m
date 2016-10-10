% Function: gamfun
% Gamma Function
%
% Parameters: 
% low, z - scalar values
%
% Return: scalar value
function v = gamfun(low,z)

fun = @(value) value.^(z-1).*exp(-value);
v = integral(fun,low,1000000);
return
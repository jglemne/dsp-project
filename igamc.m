% Function: igamc
% Incomplete Gamma Function Q(a,x)
%
% Parameters:
% a,x - scalar values
%
% Return: scalar p-value for Non-overlapping Template Matching Test
function v = igamc(a,x)

v = gamfun(x,a)/gamfun(0,a);
return
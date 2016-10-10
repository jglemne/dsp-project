% Function: binvar
%
% Parameters:
% cdf - vector with values for the cumulative distribution function
% values - values interval
% truncInterval - where to truncate the interval
%
% Return: random binary digit according to given distribution
function bin = binvar(cdf,values,truncInterval)

variate = itm(cdf,values,truncInterval);
if variate == 0
    bin = binvar(cdf,values,truncInterval);
elseif variate > 0
    bin = 1;
else
    bin = 0;
end
return
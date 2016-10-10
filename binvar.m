% Function: binvar
%
% Parameters:
% cdf - vector with values for the cumulative distribution function
% values - values interval
% truncInterval - where to truncate the interval
% method - pass a string to tell which randomization method to use, e.g.
% 'arm' which will trigger the accept-reject method
% Possible methods: 'arm', 'itm'
%
% Return: random binary digit according to given distribution
% Author: Joel Glemne
function bin = binvar(fun,values,truncInterval,method)

switch method
    case 'arm'
        variate = arm(fun,values,truncInterval);
    otherwise
        variate = itm(fun,values,truncInterval);
end
if variate == 0
    bin = binvar(fun,values,truncInterval,method);
elseif variate > 0
    bin = 1;
else
    bin = 0;
end
return
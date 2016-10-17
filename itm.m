% Function: itm (inverse transformation method)
%
% Parameters:
% cdf - vector with values for the cumulative distribution function
% values - values interval
% truncInterval - where to truncate the interval
%
% Return: random number according to given distribution
% Author: Joel Glemne
function variate = itm(cdf,values,truncInterval)

% Get random value r in [0,1]
r = rand(1);
% Get all individual differences between CDF values and r
% in order to get corresponding parameter value (inverse the CDF)
nDiff = abs(cdf-r);
% Get the index of the value with lowest difference to the
% (this is how we handle that the computer's not able to handle continuous functions)
[~, i] = min(nDiff);
% amend index when corresponding to index=1 (since r is close to 0)
if i == 1
    variate = -truncInterval;
    % Otherwise, get corresponding value to the CDF value (inverse the CDF)
else
    variate = values(i);
end

return
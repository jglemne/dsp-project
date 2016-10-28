% Function: arm (accept-reject method)
%
% Parameters:
% df - vector with values for the density function corresponding
% to an arbitrary distribution
% values - values within interval
% truncInterval - where to truncate the interval
%
% Return: random number according to given distribution
% Author: Joel Glemne
function variate = arm(df,values,interval)

% Get random value r within interval [-interval,interval]
r = 2*interval*rand(1)-interval;
% Get all individual differences between values and r
% in order to get corresponding df value
nDiff = abs(values-r);
% Get the index of the value with lowest difference to the
% (this is how we handle that the computer's not able to 
% handle continuous functions)
[~,i] = min(nDiff);
if i == 1
    i=find(values == -interval);
end
dfValue = df(i);
newr = max(df)*rand(1);
if newr > dfValue
    variate = arm(df,values,interval);
else
    variate = values(i);
end

return
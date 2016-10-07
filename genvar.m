% Function: genvar
% 
% Parameters:
% boolTrunc - set it to true if you want variates from a truncated density function, otherwise false
% eta - the mean value for the distribution
% sigma - square root of variance
% interval - the interval for which you'd like to generate density function, e.g. if the interval is [-10,10],
% then this value should be 10
% nSamples - nr of possible values in the interval, TODO: could be changed to instead correspond to the interval,
% e.g. meaning that a value of 1000 here will mean that 1000 samples will be generated for each unit interval
% nVariates - how many variates you'd like to generate
% truncInterval - if you want to truncate the function to the interval [-4,4], then truncInterval = 4
%
% Return: 1xnVariates matrix with all the generated random values from the distribution
%
% Function call example: newVariates = genvar(true,0,1,10,1000,1000,2)
% This will generate 1000 random values from a normal distribution N(0,1) with 1000 possible values in interval
% [-10,10] truncated into the interval [-2,2]
function variates = genvar(boolTrunc,eta,sigma,interval,nSamples,nVariates,truncInterval)

% Creating value interval matrix
nValues = linspace(-interval,interval,nSamples);

% Generating density functions
[oDensFun,tDensFun] = cdfs(nValues,eta,sigma,-truncInterval,truncInterval);

% Choosing to use original or truncated density function
if boolTrunc
    densFun = tDensFun;
else
    densFun = oDensFun;
end

% Creating cumulative distribution function (CDF)
% using fundamental theorem of calculus
cdf = zeros(1,nSamples);
sum = 0;
for i=2:nSamples
    sum = sum + (nValues(i)-nValues(i-1))*((densFun(i)+densFun(i-1))/2);
    cdf(i) = sum;
end

% Allocating memory for variates
variates = zeros(1,nVariates);
for counter=1:nVariates
    % Get random value r in [0,1]
    r = rand(1);
    % Get all individual differences between CDF values and r
    % in order to get corresponding parameter value (inverse the CDF)
    nDiff = abs(cdf-r);
    % Get the index of the value with lowest difference to the
    % (this is how we handle that the computer's not able to handle continuous functions)
    [~, i] = min(nDiff);
    % Get corresponding value to the CDF value (inverse the CDF)
    variates(counter) = nValues(i);
end

return
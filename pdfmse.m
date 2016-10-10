% Function: pdfmse
%
% Paramteters:
%
% nVariates - the number of randomly generated variates
% eta - mean value for distribution
% sigma - standard deviation, square root of variance
% interval - function generates values for [-interval,interval]
% truncInterval - truncates the density function to the interval
% [-truncInterval,truncInterval]
function value = pdfmse(nVariates,eta,sigma,interval,truncInterval)

% Create interval with accuracy of two decimals
nSamples = 2*interval*100+1;
samples = linspace(-interval,interval,nSamples);
% Create vector of values for truncated density function
[~,tdf] = dfs(samples,eta,sigma,-truncInterval,truncInterval);
% Generate random variates from truncated density function
variates = genvar(true,eta,sigma,interval,nVariates,truncInterval);
% Calculate and return scalar value MSE
value = mse(variates,tdf);

return
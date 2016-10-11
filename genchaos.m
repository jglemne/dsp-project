% Function: genchaos
%
% Parameters:
% nVariates - how many variates you wish to generate
% interval - generating values in the interval [-interval,interval]
%
% Return: 
% variates - matrix-vector 1xnVariates containing randomly generated 
% values according to chaotic distribution
% df - vector with values corresponding to density function for 
% chaotic distribution
%
% Author: Joel Glemne
function [variates,df] = genchaos(nVariates,interval)

[df,x] = chaos(interval);
nSamples = length(x);

% Creating cumulative distribution function (CDF)
% using fundamental theorem of calculus
cdf = zeros(1,nSamples);
sum = 0;
for i=2:nSamples-1
    sum = sum + (x(i)-x(i-1))*((df(i)+df(i-1))/2);
    if sum > 1
        cdf(i) = 1;
    else
        cdf(i) = sum;
    end
end
cdf(end) = 1;

variates = zeros(1,nVariates);
for i=1:nVariates
    variates(i) = itm(cdf,x,interval);
end

return
% Function dfs
% 
% Parameters:
% x - samples vector, matrix dimensions: 1xlen(x)
% eta - mean value of distribution
% sigma - square root of variance for the distribution
% low - lower limit of truncation interval
% high - upper limit of truncation interval
%
% Return: two vectors, dim = 1xlen(x), one with sample values
% for the density function corresponding to the ordinary normal 
% distribution (odf) and one for the truncated (tdf)
% Author: Joel Glemne
function [odf,tdf] = dfs(x,eta,sigma,low,high)

% Counting number of samples
len = length(x);
% Allocating memory
[odf,tdf] = deal(zeros(1,len));
% Density function for normal distribution
fai = @(value) exp(-(value-eta).^2/(2*sigma^2))/sqrt(2*pi*sigma^2);
% Loop through the sample values and create both odf and tdf
for i=1:len
    odf(i) = fai(x(i));
    % When the sample value is in the truncated intervals,
    % the tdf value is left as zero, otherwise it calculates the value
    % according to given solution in lecture slides
    if (low <= x(i)) && (x(i) <= high)
        tdf(i) = odf(i)/integral(fai,low,high);
    end
end
return
% Function: mse
%
% Parameters:
%
% variates - vector with n randomly generated variates, matrix dimensions
% are 1xn
% df - vector with theoretic values corresponding to a density function
%
% Return: Mean Square Error, scalar value
function value = mse(variates, df)

% nBins = number of preferred bins when dividing all variates
nBins = 1000;
% Calculating nr of variates for scaling during MSE-calculation
nVariates = length(variates);
% N is vector and N(i) is number of variates in bin i, i=1,2,...,nBins
% edges is vector and edges(i) is distribution value corresponding to 
% edge of bin, i=1,2,...,nBins+1
[N,edges]=histcounts(variates, nBins);
% calculating binWidth to later get index corresponding to middle
binWidth = edges(2)-edges(1);
indexN = 1;
sum = 0;
for i = edges(1):binWidth:edges(end)-binWidth
    % discretizing index and finding df-value
    nDiff = abs(df-i);
    [~,index] = min(nDiff);
    sum = sum + (N(indexN) - nVariates*df(index))^2;
end

value = sum/nBins;
return
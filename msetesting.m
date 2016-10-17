%% 2.2b) Checking MSE-value
% Something is very wrong with how the MSE-function is working
% mses = zeros(1,4);
nVariates = [100,1000,10000,1000000];
interval = 10;
sigma = 5;
eta = 0;
binBool = false;
truncBool = true;
nBins = 50;
method = 'itm';
variates = genvar(truncBool,binBool,eta,sigma,interval,nVariates(4),interval,method);
nSamples = 2*interval*100+1;
values = linspace(-interval,interval,nSamples);
[~,df] = dfs(values,eta,sigma,-interval,interval);
mse(variates,df)
histogram(variates,50)

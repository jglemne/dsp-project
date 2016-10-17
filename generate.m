%% 2.2a
% Generating different amounts of variates
% and showing the results

nVariates = 1000000;
truncInterval = 10;
sigma = 5;
eta = 0;
binBool = false;
truncBool = true;
nBins = 50;
method = 'itm';
variates = genvar(truncBool,binBool,eta,sigma,truncInterval,nVariates,truncInterval,method);
histogram(variates,nBins)

var(variates)
variance(eta,sigma,-truncInterval,truncInterval)

%% 2.2c

% Theoretically expected value:
v = variance(10,25);
nVariates = [100,1000,10000,1000000];
len=length(nVariates);
r_v = zeros(1,len);
truncInterval = 10;
sigma = 5;
eta = 0;
binBool = false;
truncBool = true;
nBins = 50;
method = 'itm';
for i=1:len
    variates = genvar(truncBool,binBool,eta,sigma,truncInterval,nVariates(i),truncInterval,method);
    r_v(i) = var(variates);
end
r_v
v = variance(10,sigma^2)

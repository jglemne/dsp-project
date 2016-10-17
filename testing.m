%% 4.1

nVariates = [100 1000 10000 1000000];
truncInterval = 10;
sigma = 5;
eta = 0;
binBool = true;
truncBool = true;
nBins = 50;
method = 'itm';
pvalues = zeros(1,length(nVariates));
for i=1:length(nVariates)
    variates = genvar(truncBool,binBool,eta,sigma,truncInterval,nVariates(i),truncInterval,method);
    pvalues(i) = pvalue(variates,[0 0 0 0 0 0 0 0 1]);
end
pvalues

%% 4.2

nVariates = [100 1000 10000 1000000];
len = length(nVariates);
pvalues = zeros(1,len);
for i=1:len
    [variates,df] = genchaos(nVariates(i),1,true);
    pvalues(i) = pvalue(variates,[0 0 0 0 0 0 0 0 1]);
end
pvalues
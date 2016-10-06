function variates = genvar(boolTrunc,eta,sigma,interval,nSamples,nVariates,truncInterval)

% Creating time interval
nTime = linspace(-interval,interval,nSamples);

% Generating density functions
[cDensFun,tcDensFun] = cdfs(nTime,eta,sigma,-truncInterval,truncInterval);

% Choosing to use continuous or truncated density function
if boolTrunc
    densFun = tcDensFun;
else
    densFun = cDensFun;
end

length(densFun)

% Creating cumulative distribution function
cdf = zeros(1,nSamples);
sum = 0;
for i=2:nSamples
    sum = sum + (nTime(i)-nTime(i-1))*((densFun(i)+densFun(i-1))/2);
    cdf(i) = sum;
end

variates = zeros(1,nVariates);
counter = 1;
while counter <= nVariates
    % Get index for closest value
    [~, i] = min(abs(cdf-rand(1)));
    variates(counter) = nTime(i);
    counter = counter + 1;
end

return
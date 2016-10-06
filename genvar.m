function variates = genvar(boolTrunc,eta,sigma,interval,nSamples,nVariates)

% Creating time interval
nTime = linspace(-interval,interval,nSamples);

% Generating density functions
[cDensFun,tcDensFun] = cdfs(nTime,eta,sigma,-interval,interval);

% Choosing to use continuous or truncated density function
if boolTrunc
    densFun = tcDensFun;
else
    densFun = cDensFun;
end

% Creating cumulative distribution function
cdf = zeros(1,nSamples);
sum = 0;
for i=2:nSamples
    sum = sum + (interval(i)-interval(i-1))*((densFun(i)+densFun(i-1))/2);
    cdf(i) = sum;
end

variates = zeros(1,nVariates);
counter = 1;
while counter <= nVariates
    % Get index for closest value
    [~, i] = min(abs(df-rand(1)));
    variates(counter) = interval(i);
    counter = counter + 1;
end

return
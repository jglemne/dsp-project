function [f,x] = tdf(interval,eta,sigma,low,high)

n_samples = 1001;
x = linspace(-interval,interval,n_samples);
len = length(x);

fai = @(value) exp(-(value-eta).^2/(2*sigma^2))/sqrt(2*pi*sigma^2);

f = zeros(1,len);

for i=1:len
    f(i) = fai(x(i))/integral(fai,low,high);
end

return
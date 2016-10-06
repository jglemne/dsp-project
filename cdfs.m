function [cdf,tcdf] = cdfs(x,eta,sigma,low,high)

len = length(x);
[cdf,tcdf] = deal(zeros(1,len));
fai = @(value) exp(-(value-eta).^2/(2*sigma^2))/sqrt(2*pi*sigma^2);
for i=1:len
    cdf(i) = fai(x(i));
    if (low <= x(i)) && (x(i) <= high)
        tcdf(i) = cdf(i)/integral(fai,low,high);
    else
        tcdf(i) = 0;
    end
end
return
end
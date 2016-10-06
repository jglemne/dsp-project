function f = standard_cdf(x)

% Calculates density function for mean value 0 and standard deviation 1

len = length(x);
f=zeros(1,len);
fai = @(value) exp(-value.^2/2)/sqrt(2*pi);
for i=1:len
    f(i) = fai(x(i));
end
return
end
function f = cdf(x,df)

n_samples = length(x);
f = zeros(1,n_samples);
sum = 0;
for i=2:n_samples-1
    sum = sum + (x(i)-x(i-1))*((df(i)+df(i-1))/2);
    if sum > 1
        f(i) = 1;
    else
        f(i) = sum;
    end
end
f(end) = 1;

return
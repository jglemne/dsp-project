function bin = binchaos(cdf,x,interval)

variate = itm(cdf,x,interval);

if variate == 0
    bin = binchaos(cdf,x,interval);
elseif variate > 0
    bin = 1;
else
    bin = 0;
end
return
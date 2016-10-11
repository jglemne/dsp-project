function [f_c,x] = chaos(interval)

accuracy = 2*interval*10000+1;
x = linspace(-interval,interval,accuracy);
len = length(x);
f_c = zeros(1,len);
for i=2:len-1
    f_c(i) = 1/(pi*((1-x(i)^2)^0.5));
end

f_c(end) = 1.5*f_c(end-1);
f_c(1) = 1.5*f_c(2);

return
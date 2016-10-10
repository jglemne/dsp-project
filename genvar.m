% Function: genvar
%
% Parameters:
% boolTrunc - set it to true if you want variates from a truncated
% density function, otherwise false
% boolBin - set to true if you'd like sequence of binary digits
% according to requirements in 4.1a. Otherwise, set to false
% eta - the mean value for the distribution
% sigma - square root of variance
% interval - the interval for which you'd like to generate density
% function, e.g. if the interval is [-10,10], then this value should
% be 10
% nVariates - how many variates you'd like to generate
% truncInterval - if you want to truncate the function to the
% interval [-4,4], then truncInterval = 4
% method - pass a string to tell which randomization method to use, e.g.
% 'arm' which will trigger the accept-reject method
% Possible methods: 'arm', 'itm'
%
% Return: 1xnVariates matrix with all the generated random values from
% the distribution
%
% Function call example:
% newVariates = genvar(true,false,0,1,10,10000,2,'itm')
% This will generate 10000 random values from a normal distribution
% N(0,1), truncated to the interval [-2,2] since boolTrunc=true and
% truncInterval=2. Method for getting random number will be ITM, or
% Inverse Transformation Method
% Author: Joel Glemne
function variates = genvar(...
    boolTrunc,boolBin,eta,sigma,...
    interval,nVariates,truncInterval,method)

% Creating value interval matrix with accuracy 100 values per unit
nSamples = 2*interval*100+1;
values = linspace(-interval,interval,nSamples);

% Generating density functions
[oDensFun,tDensFun] = dfs(values,eta,sigma,-truncInterval,truncInterval);

% Choosing to use original or truncated density function
if boolTrunc
    densFun = tDensFun;
else
    densFun = oDensFun;
end

% Creating cumulative distribution function (CDF)
% using fundamental theorem of calculus
cdf = zeros(1,nSamples);
sum = 0;
for i=2:nSamples-1
    sum = sum + (values(i)-values(i-1))*((densFun(i)+densFun(i-1))/2);
    if sum > 1
        cdf(i) = 1;
    else
        cdf(i) = sum;
    end
end
cdf(end) = 1;

% Allocating memory for variates
variates = zeros(1,nVariates);
for counter=1:nVariates
    switch method
        case 'arm'
            if boolBin
                variates(counter) = binvar(densFun,values,...
                    truncInterval,method);
            else
                variates(counter) = arm(densFun,values,truncInterval);
            end
        case 'itm'
            if boolBin
                variates(counter) = binvar(cdf,values,truncInterval,method);
            else
                variates(counter) = itm(cdf,values,truncInterval);
            end
        otherwise
            msg = strcat('The method "',method,...
                '" you have given is not a valid method');
            error(msg);
    end
end

return
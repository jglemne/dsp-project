% Function: mse
%
% Parameters:
%
% variates - vector with n randomly generated variates, matrix dimensions
% are 1xn
% df - vector with theoretic values corresponding to a density function
% x - vector with values for the x-axis corresponding to the df
%
% Return: Mean Square Error, scalar value
% Author: Joel Glemne
function m = mse(variates,x,df)

% Getting empirical pdf and corresponding X-vector
[pdf,X]=ksdensity(variates);
len=length(X);
sum=0;
for i=1:len
    % Get index in x
    [~,j]=min(abs(X(i)-x));
    sum=sum+(df(j)-pdf(i))^2;
end

m=sum/len;
return
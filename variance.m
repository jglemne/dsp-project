% Author: Joel Glemne
function v = variance(eta,sigma,low,high)

fai = @(value) exp(-(value-eta).^2/(2*sigma^2))/sqrt(2*pi*sigma^2);
FAI = 1/integral(fai,low,high);
first = (1+(FAI*(low*fai(low)-high*fai(high))));
second = FAI^2*((fai(low)-fai(high))^2);
v = first - second;

return
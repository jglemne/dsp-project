% Function: pvalue
% Non-overlapping Template Matching Test
%
% Parameters:
% binaries - vector dim=1xn with binary digits, IMPORTANT: has to be
% divisible by 10
% sequence - vector dim 1x9 with random binary digits, used as "template"
%
% Return: p-value, 
%
% ******* About p-value *******
% The p-value ummarizes the strength of the evidence against 
% the null hypothesis. The p-value is the probability that a perfect 
% random number generator would have produced a sequence less random 
% than the sequence that was tested, given the kind of non- randomness 
% assessed by the test. If a P-value for a test is determined to be 
% equal to 1, then the sequence appears to have perfect randomness. 
% A P-value of zero indicates that the sequence appears to be 
% completely non-random. 
% 
% Decision rule for this test: 
% If the computed P-value is < 0.01, then conclude that the sequence 
% is non-random. Otherwise, conclude that the sequence is random.
%
% Author: Joel Glemne
function P = pvalue(binaries,sequence)

N = 10;
M = length(binaries)/N;
m = 9;
mu = (M-m+1)/(2^m);
sigmatwo = M*((1/2^m)-((2*m-1)/2^(2*m)));
blocks = reshape(binaries, N, M);

W = zeros(1,N);
for row=1:N
    v=blocks(row,:);
    counter = 1;
    while counter <= length(v)-(m-1)
        if v(counter:counter+(m-1)) == sequence
            W(row) = W(row) + 1;
            counter = counter + (m-1);
        else
            counter = counter + 1;
        end
    end
end

xitwo = 0;
for i=1:N
    xitwo = xitwo + ((W(i)-mu)^2)/sigmatwo;
end

P = igamc(N/2,xitwo/2);

return
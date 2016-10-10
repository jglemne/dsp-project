% Function: pvalue
% Non-overlapping Template Matching Test
%
% Parameters:
% binaries - vector dim=1xn with binary digits, IMPORTANT: has to be
% divisible by 10
% sequence - vector dim 1xn with random binary digits, used as "template",
% preferably with n >= 9
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
function P = pvalue(binaries,template)

% setting up test parameters

% nr of binaries
nBins = length(binaries);
% number of blocks N. Conditions: 
%       M > 0.01*nBins, N <= 100
%       rem(nBins,M) == 0
N = 8;
r = rem(nBins,N);
if r ~= 0
    % discarding last elements to make remainder = 0
    binaries = binaries(1:end-r);
    nBins = length(binaries);
end
% block length M
M = nBins/N;
m = length(template); % template length
mu = (M-m+1)/(2^m); % mean
sigmatwo = M*((1/2^m)-((2*m-1)/2^(2*m))); % variance
% dividing the binaries into N blocks of length M
blocks = reshape(binaries, N, M);

% comparing with template in all N blocks
W = zeros(1,N);
for j=1:N
    block=blocks(j,:);
    counter = 1;
    while counter <= M-(m-1)
        if block(counter:counter+(m-1)) == template
            W(j) = W(j) + 1;
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
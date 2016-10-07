% 1. Continuous, discrete and truncated Gaussian density function

% Task: Continuous density function (CDF)
%% 1.1 a)

clear
clc

C = 10;
limit = 1;
eta = 0;
sigma = sqrt(1);

% Generating 10001 points in the interval [-10,10]
interval = linspace(-C,C,10001);

% Standard N(0,1) CDF and truncated CDF for the interval
[cdf,tcdf] = cdfs(interval,eta,sigma,-limit,limit);

% Numerical integration for testing, should always be approximately 1
q = trapz(interval,cdf);
tq = trapz(interval,tcdf);

% Variance for both original and truncated CDF
sv = stvar(eta,sigma,-C,C);
tv = stvar(eta,sigma,-limit,limit);

plot(interval,cdf,interval,tcdf)
% Author: Joel Glemne
% 1. Continuous, discrete and truncated Gaussian density function

% Task: Continuous density function (CDF)
%% 1.1 a)

clear
clc

C = 40;
limit = 10;
eta = 0;
sigma = 5;

% Generating 10001 points in the interval [-10,10]
interval = linspace(-C,C,10001);

% Standard N(0,1) CDF and truncated CDF for the interval
[odf,tdf] = dfs(interval,eta,sigma,-limit,limit);

% Numerical integration for testing, should always be approximately 1
q = trapz(interval,odf);
tq = trapz(interval,tdf);

% Variance for both original and truncated CDF
sv = variance(eta,sigma,-C,C);
tv = variance(eta,sigma,-limit,limit);

plot(interval,odf,interval,tdf)
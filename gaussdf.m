% Author: Joel Glemne
% 1. Continuous, discrete and truncated Gaussian density function

% Task: Continuous density function (CDF)
%% 1.1 a)

clear
clc

C = 10; % change this to 40 for testing 1.4a
T = 4; % change this to 10 for testing 1.4a
eta = 0;
sigma = 1; % change this to 2, 3 or 5 for testing 1.4a 
% low value on n_samples for clear zoomed out picture,
% high value for seeing zoomed in differences,
% as a suggestion: low = 51 and high = 10001
n_samples = 51;

% Generating n_samples points in the interval [-10,10]
interval = linspace(-C,C,n_samples);

% Standard N(0,1) CDF and truncated CDF for the interval
[odf,tdf] = dfs(interval,eta,sigma,-T,T);

% Numerical integration for testing, should always be approximately 1
q = trapz(interval,odf);
tq = trapz(interval,tdf);

% Variance for both original and truncated CDF
sv = variance(eta,sigma,-C,C);
tv = variance(eta,sigma,-T,T);

figure
hold on
p = plot(interval,odf,interval,tdf);
s_e = strcat(' N(',num2str(eta),',',num2str(sigma),') ');
i_t = strcat(' [-',num2str(T),',',num2str(T),']');
t_text = strcat('Continuous density function ',s_e,' truncated to ',i_t);
t = title(t_text);
xl = xlabel('Variates');
yl = ylabel(s_e);
[xl.FontSize,yl.FontSize,t.FontSize] = deal(14);
p(1).LineWidth = 5;
p(1).Color = 'y';
p(2).Color = 'k';
p(1).DisplayName = 'Non-truncated';
p(2).DisplayName = 'Truncated';
p(2).Marker = '*';
legend('show')
grid on

%% Task 1.1 b)

C = 10;
ti = [3,2,1.5,1];
tilen = length(ti);
eta = 0;
sigma = 1;

% Generating 10001 points in the interval [-10,10]
interval = linspace(-C,C,10001);

% Standard N(0,1) CDF and truncated CDFs for the interval
[orig,one] = dfs(interval,eta,sigma,-ti(1),ti(1));
[~,two] = dfs(interval,eta,sigma,-ti(2),ti(2));
[~,three] = dfs(interval,eta,sigma,-ti(3),ti(3));
[~,four] = dfs(interval,eta,sigma,-ti(4),ti(4));

% Variance for both original and truncated CDF
variances = zeros(1,tilen+1);
variances(1) = variance(eta,sigma,-C,C);
for i=2:tilen+1
    variances(i) = variance(eta,sigma,-ti(i-1),ti(i-1));
end

figure
p = plot(interval,orig,interval,one,interval,two,interval,three,interval,four);
t = title('Continuos density function N(0,1) truncated to different intervals');
xl = xlabel('Variates');
yl = ylabel('N(0,1)');
[xl.FontSize,yl.FontSize,t.FontSize] = deal(14);
[p(1).LineWidth,p(2).LineWidth,p(3).LineWidth,p(4).LineWidth,p(5).LineWidth] = deal(2);
p(1).Color = 'k';
p(2).Color = 'y';
p(3).Color = 'r';
p(4).Color = 'b';
p(5).Color = 'm';
p(1).DisplayName = 'Non-truncated';
for i=1:tilen
    p(i+1).DisplayName = strcat('Truncated to [-',num2str(ti(i)),',',num2str(ti(i)),']');
end
legend('show')
grid on
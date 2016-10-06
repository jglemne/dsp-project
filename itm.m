%% ITM - Inverse transformation method
%% Normal distribution

C = 10;
eta = 0;
sigma = sqrt(1);
interval = linspace(-C,C,10001);
len = length(interval);
df = zeros(1,len);
fai = @(value) exp(-(value-eta).^2/(2*sigma^2))/sqrt(2*pi*sigma^2);

% Get values for distribution function, df
for i=1:len
    df(i)=integral(fai,interval(1),interval(i));
end

%% Truncated distribution

C=10;
limit = 2;
eta = 0;
sigma = sqrt(1);
interval = linspace(-C,C,10001);
len = length(interval);

[~,tcdf] = cdfs(interval,eta,sigma,-limit,limit);

plot(interval,tcdf)

tdf = zeros(1,len);
sum = 0;
for i=2:len
    sum = sum + (interval(i)-interval(i-1))*((tcdf(i)+tcdf(i-1))/2);
    tdf(i) = sum;
end

%% Generating samples from given distribution

nr_of_samples = 1000;
samples = zeros(1,nr_of_samples);
counter = 1;
while counter <= nr_of_samples
    % Get index for closest value
    [~, i] = min(abs(df-rand(1)));
    samples(counter) = interval(i);
    counter = counter + 1;
end
% Plotting the inverse
% plot(df,interval)
%% Testing MSE

clear
clc

t=10;
eta=0;
sigma=5;
nVariates=[100,500,1000,5000,10000,50000,100000,500000,1000000];
len = length(nVariates);
[df,x]=tdf(t,eta,sigma,-t,t);
c=cdf(x,df);
mses = zeros(1,len);
for i=1:len
    variates = newgen(false,x,df,c,nVariates(i),t,'itm');
    mses(i) = mse(variates,x,df);
end
figure
p = plot(nVariates,mses);
p(1).Marker = '*';
t = title('MSE depending on number of variates');
xl = xlabel('Number of variates');
yl = ylabel('Mean Square Error');
[t.FontSize,xl.FontSize,yl.FontSize] = deal(14);
grid on
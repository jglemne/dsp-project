%%task3.1



%% a 

%%First we need to set up the step size and the range of input c, then we
%%espress the relation between the c and f_c which is the continuous
%%chaotic probability density function(cpdf). And I also polt the graph of
%%E_c which represents the product of c times f_c, so we can get the
%%diagram posted on the tutorial materials. But when I calculated the mean
%%and variance of the density function I was told that the mean of f_c is
%%infinity and the variance is not a number.

tstart=tic;
c=-1:0.001:1;
len = length(c);
f_c = zeros(1,len);
for i=2:len-1
    f_c(i)=1/(pi*((1-c(i)^2)^0.5));
end
f_c(1)=f_c(2);
f_c(end)=f_c(end-1);
plot(c,f_c);
telapsed = toc(tstart);

E_c=c.*f_c;
% plot(c,E_c);

m=mean(f_c(2:len-1));
v=var(f_c);


%% 

%%In the second part we are asked to generate different variates of the
%%cpdf and find the empirical cpdf. I just use the 'for' loop to express
%%it. First I need to generate a random intial value 'i' by using the
%%code 2* rand(1,1)-1, and a zero matrix 's' to save the generated chaotic
%%numbers, the capacity 'n' of 's' can be various like 100, 1000, or 10000.
%%Then we set up the step 't' from one to n, put all the chaotic numbers
%%into the zero matrix one by one with the step till the expiry of the
%%matrix. So we can obtain a matrix with chaotic numbers at last.
 
% %for loop;
i=2*rand(1)-1;
n=1000000;
s=zeros(1,n);
for t=1:n;
    i=2*i^2-1;
    s(t)=i;
end

mean(s);
var(s);
histogram(s,100);

  
%% c

%%The meaning of MSE is comparing all the chaotic numbers in the generated
%%matrix with the mean value to find the mean square error of the cpdf. So
%%we made up a matrix with the same parameters as 's' which called 'k',
%%each element of 'k' is made up by the mean value of 's'. Next step we use
%%the formula to get the value of MSE.

k=mean(s)*[ones(1,n)];

MSE=sqrt(sum((s-k).^2)/n);


%% d 

%%In this case we just neet to generate three matrixes to be detected and
%%caculated the variance of them. From the slids of the chaotic stochastic
%%processes(page 8) we can figure out that the theoretically expected
%%value can be calculated by the formula and it values 0.5. After comparing
%%with the expected value we found out that the more variates we pick, the
%%closer we can get to the expected value.

i1=2* rand(1,1)-1;
n1=1000;
s1=zeros(1,n1);
t1=1;
for t1=1:n1;
    i1=2*i1^2-1;
    s1(1,t1)=i1;
end
v1=var(s1);

i2=2* rand(1,1)-1;
n2=10000;
s2=zeros(1,n2);
t2=1;
for t2=1:n2;
    i2=2*i2^2-1;
    s2(1,t2)=i2;
end
v2=var(s2);

i3=2* rand(1,1)-1;
n3=1000000;
s3=zeros(1,n3);
t3=1;
for t3=1:n3;
    i3=2*i3^2-1;
    s3(1,t3)=i3;
end
v3=var(s3);

%%e 

%%In this part I didn't saperate the chaotic random values to 1000 samples
%%with 10 variates each. Instead I juet generate 10000 chaotic random
%%numbers and imagine them as 1000 samples, and use the pedometer to pick
%%out the 5th and 10th of each sample(T5 and T10). Then calculate the mean
%%value and variance of them.

i=2* rand(1,1)-1;
n=10000;
s=zeros(1,n);
t=1;
for t=1:n;
    i=2*i^2-1;
    s(1,t)=i;
end

T5=s(5:10:9995);
T10=s(10:10:10000);

m5=mean(T5);
v5=var(T5);

m10=mean(T10);
v10=var(T10);

%%f

%%I just search the internet for the stationarity of the process, and found
%%out the code to exam it luckily. The 'K' repersents whether the process
%%is stable, when K equals to 1 it's stable , otherwise it will equal to 0.

i=2* rand(1,1)-1;
s=zeros(1,100);
t=1;
for t=1:100;
    i=2*i^2-1;
    s(1,t)=i;
end

mean(s);
var(s);
hist(s);

K=adftest(s);


%%g

%%The word ergodic means the process can be obtained from the process of a
%%sample function of its various statistical properties, with this 
%%characteristic of the random process is called with each state after the 
%%random process. So after we check the histogram we can obtain the
%%diagrams with the similar trend of the whole process.


i=2* rand(1,1)-1;
S=zeros(1,10000);
t=1;
for t=1:10000;
    i=2*i^2-1;
    S(1,t)=i;
end


T5=S(5:10:9995);
T10=S(10:10:10000);

m5=mean(T5);
v5=var(T5);

m10=mean(T10);
v10=var(T10);

    
hist(T5(:));
hist(T10(:));
hist(S(:));
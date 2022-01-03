%Q1sol
clear all
close all
clc
%%%%%%%%%%%%%%%%%%%%%
%a)
% f is actually a Weinbull function
%F=integral(f) with limi of 0 and x
% F=1-exp(-x^gamma/beta)
% F=R => x=(-log(1-R). beta)^(1/gamma)
gamma=1.5; beta=1;
NN=2000;

x=(-log(1-rand(NN,1))*beta).^(1/gamma);
figure,histogram(x)
%%%%%%%%%%
%b)
h=histogram(x,'Normalization','pdf');
xx=0:h.BinWidth:h.BinLimits(2)-h.BinWidth;
f=(gamma/beta)*(xx).^(gamma-1).*exp(-(xx.^gamma)/beta);
figure,plot(xx,h.Values,'b','LineWidth',2), hold on
plot(xx,f,'r','LineWidth',2)
%%%%%%%%%%%%
%c)
[normalizedACF, lags] = autocorr(x,'NumLags',10);
figure,bar(lags,normalizedACF)
abs(normalizedACF.*100), % amout of correlation in %
%indicating good independency + verification from b) => sucessfull RVN generation
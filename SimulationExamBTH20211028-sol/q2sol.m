%q2sol

clear all
close all
clc
%%%%%%%%%%%%%%%%%
%a)
%  estimation of integral(x exp(x^2)) in range of 0-1 (this is a Monte
%  Carlso integration)
gamma=1.5; beta=1;
n=10000;
xrange=4; %good app. of x in the pdf (you can plot the pdf to observe the range of x)
xx=xrange*rand(n,1); 
f1=(gamma/beta)*(xx).^(gamma-1).*exp(-(xx.^gamma)/beta);
Px=sum(f1)*xrange/n
figure,plot(xx,f1,'.')
%%%%%%%%%%%%%%%%%%%%%%%%%
%b)
tp1=find(xx<=0.45);
Px1=sum(f1(tp1))*xrange/n

tp2=find(xx<=2.25);
Px2=sum(f1(tp2))*xrange/n

P=Px2-Px1
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%c)
gamma=1.5; beta=1;
n=10000;
xrange=4;
Pv=[];
for kk=1:100
    xx=xrange*rand(n,1); 
    f2=(gamma/beta)*(xx).^(gamma-1).*exp(-(xx.^gamma)/beta);
    %%%%%%%%
    tp1=find(xx<=0.45);
    Px1=sum(f2(tp1))*xrange/n;

    tp2=find(xx<=2.25);
    Px2=sum(f2(tp2))*xrange/n;

    P=Px2-Px1;
    Pv=[Pv,P];
end
mean(Pv)
std(Pv)
cv=var(Pv)/mean(Pv)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%d
gamma=1.5; beta=1;
n=10000/2;
xrange=4;
Pva=[];
for kk=1:100
    xx=xrange*rand(n,1); 
    f3=(gamma/beta)*(xx).^(gamma-1).*exp(-(xx.^gamma)/beta);
    %%%
    tp1=find(xx<=0.45);
    Px1a=sum(f3(tp1))*xrange/n;
    %antithetic 
    xx=xrange*(1-rand(n,1)); 
    f3=(gamma/beta)*(xx).^(gamma-1).*exp(-(xx.^gamma)/beta);
    %%%
    tp1=find(xx<=0.45);
    Px1b=sum(f3(tp1))*xrange/n;
    %%%
    Px1=(Px1a+Px1b)/2;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    tp2=find(xx<=2.25);
    Px2a=sum(f3(tp2))*xrange/n;
    %antithetic 
    xx=xrange*(1-rand(n,1)); 
    f3=(gamma/beta)*(xx).^(gamma-1).*exp(-(xx.^gamma)/beta);
    %%%
    tp2=find(xx<=2.25);
    Px2b=sum(f3(tp2))*xrange/n;
    %%%
    Px2=(Px2a+Px2b)/2;


    P=Px2-Px1;
    Pva=[Pva,P];
end
mean(Pva)
std(Pva)
cv=var(Pva)/mean(Pva)
figure,plot(Pv,'b'), hold on, plot(Pva,'r')

diffMean=mean(Pva)-mean(Pv)
diffStd=std(Pva)-std(Pv)
















 
%Q1sol
clear all
close all
clc
%%%%%%%%%%%%%%%%%%%%%
lambda=6.5;mu=10;endtime=1500;
[N,T,ro]=Q1sim(lambda,mu,endtime);
figure,plot(ro)
freqCount=0;
for kk=1:200
    lambda=6.5;mu=10;endtime=200;
    [N,T,ro]=Q1sim(lambda,mu,endtime);
    if sum(ro(1:10)>1)>0
        freqCount=freqCount+1;
    end
end
prob=freqCount/1000 *100; %procent of prob
%%%%%%%%%%
lambdaV=[1.5,2.5,3.5,4.5,5.5,6.5,7.5,8.5,9.5];
freqCountV=[];
for pp=1:length(lambdaV)
    freqCount=0;
    for kk=1:200
        lambda=lambdaV(pp);mu=10;endtime=200;
        [N,T,ro]=Q1sim(lambda,mu,endtime);
        if sum(ro(1:10)>1)>0
            freqCount=freqCount+1;
        end
    end
    freqCountV=[freqCountV,freqCount];
end

figure,bar(freqCountV/200 *100)

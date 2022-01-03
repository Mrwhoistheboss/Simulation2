%q2sol
clear all
close all
clc
%%%%%%%%%%%%%%%%%%%%%
lambda=7.5;mu=10;endtime=1500;
[N,Tm,T,ro]=Q1sim(lambda,mu,endtime);
figure,plot(sort(T),'Linewidth',2),title('T for whole simulation')
figure,plot(sort(Tm),'Linewidth',2),title('Tm for whole simulation')
figure,plot(sort(N),'Linewidth',2),title('N for whole simulation')
figure,plot(ro,'Linewidth',2),title('ro for whole simulation')
%%%%%%%%%%%%%%
% b)the algorithm
ru=lambda/mu;
tp1=find(ro<=(ru-ru*0.03)| ro>=(ru+ru*0.03));
tp=(tp1(end):length(ro));
figure,plot(sort(Tm(tp)),'Linewidth',2),title('Tm for system time')
figure,plot(sort(N(tp)),'Linewidth',2),title('N for system time')
systemTime=length(tp)
setupTime=tp(1)
%%%%%%%%%%%%%%%%
% c)
meanV1=[];
TxStdV1=[];
meanV2=[];
TxStdV2=[];
KK=1;
while 1
    if KK==50
        break;
    end
    [NN,Tm,T,ro]=Q1sim(lambda,mu,endtime);
    ru=lambda/mu;
    tp1=find(ro<=(ru-ru*0.03)| ro>=(ru+ru*0.03));
    if ~isempty(tp1)
        tp=(tp1(end):length(ro));
        %%%%%%%
        N = size(NN,2);     % Number of ‘Experiments’ In Data Set
        TxMu = mean(NN);	 % Mean Of All Experiments At Each Value Of ‘x’
        s = sqrt( (1/(N-1)) * (sum((NN-TxMu).^2)) );
        TxStd = s/sqrt(N);	% Compute ‘Standard Error Of The Mean’ 

        meanV1=[meanV1,TxMu];
        TxStdV1=[TxStdV1,TxStd];
        %%%%%%%
        N = size(NN(tp),2);     % Number of ‘Experiments’ In Data Set
        TxMu = mean(NN(tp));	 % Mean Of All Experiments At Each Value Of ‘x’
        s = sqrt( (1/(N-1)) * (sum((NN(tp)-TxMu).^2)) );
        TxStd = s/sqrt(N);	% Compute ‘Standard Error Of The Mean’ 

        meanV2=[meanV2,TxMu];
        TxStdV2=[TxStdV2,TxStd];
        KK=KK+1;
    end
end
figure,plot(sort(meanV1),'Linewidth',2),hold on
plot(sort(TxStdV1),'Linewidth',2)
plot(sort(meanV2),'Linewidth',2)
plot(sort(TxStdV2),'Linewidth',2)
legend('Mean','Standard Error','Mean in system time','Standard Error in system time')
%%%%%%%%%%%%%%%%
% d)
[bins,p]=acNhist2(meanV1);
figure(10),plot(bins,p,'b','LineWidth',2);hold on
grid minor;
%%%
[bins,p]=acNhist2(meanV2);
figure(10),plot(bins,p,'k','LineWidth',2);
grid minor;
title('Distribution of the mean')
legend('Mean','Mean in system time')
%%%%%%%%%%%%%%%%%
[bins,p]=acNhist2(TxStdV1);
figure(20),plot(bins,p,'b','LineWidth',2);hold on
grid minor;
%%%
[bins,p]=acNhist2(TxStdV2);
figure(20),plot(bins,p,'k','LineWidth',2);
grid minor;
title('Distribution of the signal')

legend('Standard Error','Standard Error in system time')

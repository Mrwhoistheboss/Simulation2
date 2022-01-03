%q3sol
clear all
close all
clc
%%%%%%%%%%%%%%%%%%%%%
% Bact-Mean method
lambda=6.5;mu=10;endtime=10000;ru=lambda/mu;
while 1
    [numberOfCustomersInsystem,customersTimeInSystem,T,ro]=Q1sim(lambda,mu,endtime);
    
    tp1=find(ro(1:1000)<=(ru-ru*0.005)| ro(1:1000)>=(ru+ru*0.05));
    if ~isempty(tp1)
        tp=(tp1(end):length(ro));
        setupTime=length(ro)-length(tp);
        systemTime=length(tp);
        batchSize=setupTime,
        numOfBatches=floor(endtime/batchSize),
    end
    if numOfBatches>=41
        numOfBatches=41;
        figure,plot(ro,'k','Linewidth',2),hold on,plot(ro(1:setupTime),'r','Linewidth',2)
        break;
    end
end
batchSize,
numOfBatches
%%%%%%%%%%%%%%%
figure,plot(numberOfCustomersInsystem)
figure,plot(customersTimeInSystem)
%%%%%%%%%%%%
bacthdataN=zeros(numOfBatches,batchSize);
bacthdataT=zeros(numOfBatches,batchSize);

for kk=0:batchSize:endtime-batchSize
  bacthdataN(1+kk/batchSize,:)=numberOfCustomersInsystem(kk+1:kk+batchSize);
  bacthdataT(1+kk/batchSize,:)=customersTimeInSystem(kk+1:kk+batchSize); 
end
%%%%%%%%%%%%
calculateCI(bacthdataT',1)
calculateCI(bacthdataN',1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Replication-delition method
% clc
%%%%%
lambda=6.5;mu=10;endtime=10000;
numOfBatches=0;
bacthdataN=[];
bacthdataT=[];
while 1
    [numberOfCustomersInsystem,customersTimeInSystem,T,ro]=Q1sim(lambda,mu,endtime);
    ru=lambda/mu;
    tp1=find(ro(1:1000)<=(ru-ru*0.005)| ro(1:1000)>=(ru+ru*0.05));
    if ~isempty(tp1)
        tp=(tp1(end):length(ro));
        setupTime=length(ro)-length(tp);
        systemTime=length(tp);
        batchSize=setupTime,
        numOfLocalBatches=floor(endtime/batchSize),

        if numOfLocalBatches>=2
            nC=numberOfCustomersInsystem(tp);% number of customers in system time
            nC1batch=nC(1:batchSize); %one batch size of nC

            nT=customersTimeInSystem(tp);% sojourntime of customers in system time
            nT1batch=nT(1:batchSize); %one batch size of nT

            bacthdataN=[bacthdataN,mean(nC1batch)];
            bacthdataT=[bacthdataN,mean(nT1batch)];
            numOfBatches=numOfBatches+1,
        end
    end
    if numOfBatches==40 
        break;
    end
end
%%%%%%%%%%%%
calculateCI(bacthdataN',0)
calculateCI(bacthdataT',0)











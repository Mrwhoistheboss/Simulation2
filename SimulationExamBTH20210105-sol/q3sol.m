%Q3sol
clear all
close all
clc
%%%%%%%%%%%%%%%%%%%%%
% Bact-Mean method
batchSize=500;
numOfBatches=41; %one batch is not considred according to the warmup
lambda=6.5;mu=10;endtime=batchSize*numOfBatches;
[numberOfCustomersInsystem,customersTimeInSystem]=Q3sim(lambda,mu,endtime);
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
Tx=mean(bacthdataT'); %customersTimeInSystem
Tx=Tx(2:end);
N = size(Tx,2);     % Number of ‘Experiments’ In Data Set
TxMu = mean(Tx)	 % Mean Of All Experiments At Each Value Of ‘x’
s = sqrt( (1/(N-1)) * (sum((Tx-TxMu).^2)) )
TxStd = s/sqrt(N);	% Compute ‘Standard Error Of The Mean’ Of All Experiments At Each Value Of ‘x’
CI50 = tinv(1-(1-0.50)/2, N-1)	% Calculate 50% Probability Intervals Of t-Distribution
CI60 = tinv(1-(1-0.60)/2, N-1)	% Calculate 60% Probability Intervals Of t-Distribution
CI75 = tinv(1-(1-0.75)/2, N-1)	% Calculate 75% Probability Intervals Of t-Distribution
Tx_CI50U = TxMu + CI50*TxStd,Tx_CI75U = TxMu + CI75*TxStd,Tx_CI60U = TxMu + CI60*TxStd,
Tx_CI50L = TxMu - CI50*TxStd,Tx_CI75L = TxMu - CI75*TxStd,Tx_CI60L = TxMu - CI60*TxStd
figure
plot(TxMu,'o')	% Plot Mean Of All Experiments
hold on
yline(TxMu,'r','linewidth',2),grid minor
yline(Tx_CI50U,'g','linewidth',2)
yline(Tx_CI50L,'g','linewidth',2)

yline(Tx_CI75U,'b','linewidth',2)
yline(Tx_CI75L,'b','linewidth',2)

yline(Tx_CI60U,'k','linewidth',2)
yline(Tx_CI60L,'k','linewidth',2)
%%%%%%%%%%%
Tx=mean(bacthdataN'); %numberOfCustomersInsystem
Tx=Tx(2:end);
N = size(Tx,2);     % Number of ‘Experiments’ In Data Set
TxMu = mean(Tx)	 % Mean Of All Experiments At Each Value Of ‘x’
s = sqrt( (1/(N-1)) * (sum((Tx-TxMu).^2)) )
TxStd = s/sqrt(N);	% Compute ‘Standard Error Of The Mean’ Of All Experiments At Each Value Of ‘x’
CI50 = tinv(1-(1-0.50)/2, N-1)	% Calculate 50% Probability Intervals Of t-Distribution
CI60 = tinv(1-(1-0.60)/2, N-1)	% Calculate 60% Probability Intervals Of t-Distribution
CI75 = tinv(1-(1-0.75)/2, N-1)	% Calculate 75% Probability Intervals Of t-Distribution
Tx_CI50U = TxMu + CI50*TxStd,Tx_CI75U = TxMu + CI75*TxStd,Tx_CI60U = TxMu + CI60*TxStd,
Tx_CI50L = TxMu - CI50*TxStd,Tx_CI75L = TxMu - CI75*TxStd,Tx_CI60L = TxMu - CI60*TxStd
figure
plot(TxMu,'o')	% Plot Mean Of All Experiments
hold on
yline(TxMu,'r','linewidth',2),grid minor
yline(Tx_CI50U,'g','linewidth',2)
yline(Tx_CI50L,'g','linewidth',2)

yline(Tx_CI75U,'b','linewidth',2)
yline(Tx_CI75L,'b','linewidth',2)

yline(Tx_CI60U,'k','linewidth',2)
yline(Tx_CI60L,'k','linewidth',2)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
clc
%%%%%
% Replication-delition method
batchSize=500;
numOfBatches=40; 
lambda=8;mu=10;endtime=batchSize*2;
% bacthdataN=zeros(numOfBatches,batchSize);
% bacthdataT=zeros(numOfBatches,batchSize);
for kk=1:numOfBatches-1
  [numberOfCustomersInsystem,customersTimeInSystem]=Q3sim(lambda,mu,endtime);
  bacthdataN(kk)=mean(numberOfCustomersInsystem(batchSize+1:end));%one batch is not considred according to the warmup
  bacthdataT(kk)=mean(customersTimeInSystem(batchSize+1:end)); %one batch is not considred according to the warmup
end
%%%%%%%%%%%
Tx=bacthdataT; %customersTimeInSystem
Tx=Tx(2:end);
N = size(Tx,2);     % Number of ‘Experiments’ In Data Set
TxMu = mean(Tx)	 % Mean Of All Experiments At Each Value Of ‘x’
s = sqrt( (1/(N-1)) * (sum((Tx-TxMu).^2)) )
TxStd = s/sqrt(N);	% Compute ‘Standard Error Of The Mean’ Of All Experiments At Each Value Of ‘x’
CI50 = tinv(1-(1-0.50)/2, N-1)	% Calculate 50% Probability Intervals Of t-Distribution
CI60 = tinv(1-(1-0.60)/2, N-1)	% Calculate 60% Probability Intervals Of t-Distribution
CI75 = tinv(1-(1-0.75)/2, N-1)	% Calculate 75% Probability Intervals Of t-Distribution
Tx_CI50U = TxMu + CI50*TxStd,Tx_CI75U = TxMu + CI75*TxStd,Tx_CI60U = TxMu + CI60*TxStd,
Tx_CI50L = TxMu - CI50*TxStd,Tx_CI75L = TxMu - CI75*TxStd,Tx_CI60L = TxMu - CI60*TxStd
figure
plot(TxMu,'o')	% Plot Mean Of All Experiments
hold on
yline(TxMu,'r','linewidth',2),grid minor
yline(Tx_CI50U,'g','linewidth',2)
yline(Tx_CI50L,'g','linewidth',2)

yline(Tx_CI75U,'b','linewidth',2)
yline(Tx_CI75L,'b','linewidth',2)

yline(Tx_CI60U,'k','linewidth',2)
yline(Tx_CI60L,'k','linewidth',2)
%%%%%%%%%%%
Tx=bacthdataT; %numberOfCustomersInsystem
Tx=Tx(2:end);
N = size(Tx,2);     % Number of ‘Experiments’ In Data Set
TxMu = mean(Tx)	 % Mean Of All Experiments At Each Value Of ‘x’
s = sqrt( (1/(N-1)) * (sum((Tx-TxMu).^2)) )
TxStd = s/sqrt(N);	% Compute ‘Standard Error Of The Mean’ Of All Experiments At Each Value Of ‘x’
CI50 = tinv(1-(1-0.50)/2, N-1)	% Calculate 50% Probability Intervals Of t-Distribution
CI60 = tinv(1-(1-0.60)/2, N-1)	% Calculate 60% Probability Intervals Of t-Distribution
CI75 = tinv(1-(1-0.75)/2, N-1)	% Calculate 75% Probability Intervals Of t-Distribution
Tx_CI50U = TxMu + CI50*TxStd,Tx_CI75U = TxMu + CI75*TxStd,Tx_CI60U = TxMu + CI60*TxStd,
Tx_CI50L = TxMu - CI50*TxStd,Tx_CI75L = TxMu - CI75*TxStd,Tx_CI60L = TxMu - CI60*TxStd
figure
plot(TxMu,'o')	% Plot Mean Of All Experiments
hold on
yline(TxMu,'r','linewidth',2),grid minor
yline(Tx_CI50U,'g','linewidth',2)
yline(Tx_CI50L,'g','linewidth',2)

yline(Tx_CI75U,'b','linewidth',2)
yline(Tx_CI75L,'b','linewidth',2)

yline(Tx_CI60U,'k','linewidth',2)
yline(Tx_CI60L,'k','linewidth',2)









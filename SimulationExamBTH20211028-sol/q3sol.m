%Q3sol
clear all
close all
clc
%%%%%%%%%%%%%%%%%%%%%
%a)
% Bact-Mean method
batchSize=100;
numOfBatches=41; %Due to that the simulation doeas not end with exact endtime, we take one more batches which is not going to be included
lambda=7.5;mu=10;endtime=batchSize*numOfBatches;
[numberOfCustomersInsystem,customersTimeInSystem]=Qx(lambda,mu,endtime);
% figure,plot(numberOfCustomersInsystem)
% figure,plot(customersTimeInSystem)
%%%%%%%%%%%%
bacthdataN=zeros(numOfBatches,batchSize);
bacthdataT=zeros(numOfBatches,batchSize);

for kk=0:batchSize:endtime-2*batchSize  
  bacthdataN(1+kk/batchSize,:)=numberOfCustomersInsystem(kk+1:kk+batchSize);
  bacthdataT(1+kk/batchSize,:)=customersTimeInSystem(kk+1:kk+batchSize); 
end
% relHalfSize=calculateCI(inData,flag,roundnessLevel)
relHalfSize=calculateCI(bacthdataT',2,3); % without warmup
figure,bar(relHalfSize)
M1=customersTimeInSystem(1:4000);
%%%%%%%%%%%%
% b)
batchSize=500;
numOfBatches=41; 
lambda=7.5;mu=10;endtime=batchSize*numOfBatches;
[numberOfCustomersInsystem,customersTimeInSystem]=Qx(lambda,mu,endtime);
% figure,plot(numberOfCustomersInsystem)
% figure,plot(customersTimeInSystem)
%%%%%%%%%%%%
bacthdataN=zeros(numOfBatches,batchSize);
bacthdataT=zeros(numOfBatches,batchSize);

for kk=0:batchSize:endtime-2*batchSize
  bacthdataN(1+kk/batchSize,:)=numberOfCustomersInsystem(kk+1:kk+batchSize);
  bacthdataT(1+kk/batchSize,:)=customersTimeInSystem(kk+1:kk+batchSize); 
end
relHalfSize=calculateCI(bacthdataT',2,3); % without warmup
figure,bar(relHalfSize)
M2=customersTimeInSystem(1:4000);
%%%%%%%%%%%%%%%%%%%
% c)
% the relative CI when the length of batches is increasd by 5 time is
% reduced. This is due to the increase of data points.

% Also the fluctation of relative CI ( the varince)becomes less when  
% length of batches is 500; this is due to that the variance of each batch
% becomes more steady
%%%%%%%%%%%%%%%%
%d)
figure,plot(M1,'b'), hold on, plot(M2,'r')

figure,h1 = histogram(M1);hold on,h2 = histogram(M2);
h1.Normalization = 'probability';
h1.BinWidth = 0.01;
h2.Normalization = 'probability';
h2.BinWidth = 0.01;

pd1=fitdist(M1','exponential')

pd2=fitdist(M2','exponential')
% The results shows two different exponential, due to effect of warming up
% (length of batches)






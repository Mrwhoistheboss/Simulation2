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
[numberOfCustomersInsystem,customersTimeInSystem]=Qxm(lambda,mu,endtime);
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
relHalfSize=calculateCI(bacthdataT',2,5); % without warmup

figure,bar(relHalfSize)

M1=numberOfCustomersInsystem(1:4000);
%%%%%%%%%%%%%%%%%%%%%%%
%b)
% Bact-Mean method
batchSize=500;
numOfBatches=41; %Due to that the simulation doeas not end with exact endtime, we take one more batches which is not going to be included
lambda=7.5;mu=10;endtime=batchSize*numOfBatches;
[numberOfCustomersInsystem,customersTimeInSystem]=Qxm(lambda,mu,endtime);
% figure,plot(numberOfCustomersInsystem)
% figure,plot(customersTimeInSystem)
%%%%%%%%%%%%
bacthdataN=zeros(numOfBatches,batchSize);
bacthdataT=zeros(numOfBatches,batchSize);

for kk=0:batchSize:endtime-2*batchSize  
  bacthdataN(1+kk/batchSize,:)=numberOfCustomersInsystem(kk+1:kk+batchSize);
  bacthdataT(1+kk/batchSize,:)=customersTimeInSystem(kk+1:kk+batchSize); 
end
relHalfSize=calculateCI(bacthdataT',2,5); % without warmup

figure,bar(relHalfSize)
M2=numberOfCustomersInsystem(1:4000);
%%%%%%%%%%
%c & d)
% the relative CI when the length of batches is increasd by 5 time is
% reduced. This can be due to the increase of data points.

% However the variation of relative CI is limited due to determinstic
% function periodicfrequency. It has become more rigid.


%%%%%%%%%%%%%%%%%%%%%%%%%
figure,plot(M1,'b'), hold on, plot(M2,'r')

figure,h1 = histogram(log(M1));hold on,h2 = histogram(log(M2));
h1.Normalization = 'probability';
h1.BinWidth = 0.01;
h2.Normalization = 'probability';
h2.BinWidth = 0.01;

% no possible to make fitting of distribution, the result is not
% exponential


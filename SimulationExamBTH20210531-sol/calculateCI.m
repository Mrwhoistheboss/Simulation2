function calculateCI(inData,flag)

if flag==1
    Tx=mean(inData); %customersTimeInSystem
    Tx=Tx(2:end);
    N = size(Tx,2);     % Number of ‘Experiments’ In Data Set
    TxMu = mean(Tx)	 % Mean Of All Experiments At Each Value Of ‘x’
    s = sqrt( (1/(N-1)) * (sum((Tx-TxMu).^2)) );
else 
     TxMu = mean(inData);
     N = length(inData);
     s = sqrt( (1/(N-1)) * TxMu.^2);
end


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
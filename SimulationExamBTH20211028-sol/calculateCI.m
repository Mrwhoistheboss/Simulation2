function relHalfSize=calculateCI(inData,flag,roundnessLevel)

if flag==1
    Tx=mean(inData); %customersTimeInSystem
    Tx=Tx(2:end);
    N = size(Tx,2);     % Number of ‘Experiments’ In Data Set
    TxMu = mean(Tx);	 % Mean Of All Experiments At Each Value Of ‘x’
    s = sqrt( (1/(N-1)) * (sum((Tx-TxMu).^2)) );
else 
     TxMu = mean(inData);
     N = length(inData);
     s = sqrt( (1/(N-1)) * TxMu.^2);
end

TxStd = s/sqrt(N);	% Compute ‘Standard Error Of The Mean’ Of All Experiments At Each Value Of ‘x’
CI95 = tinv(1-(1-0.95)/2, N-1);	% Calculate 95% Probability Intervals Of t-Distribution
CIhalfSize=CI95.*TxStd;
Tx_CI95U = TxMu +CIhalfSize;
Tx_CI95L = TxMu - CIhalfSize;

relHalfSize=round(CIhalfSize,roundnessLevel)./round(TxMu,roundnessLevel);


 %q5sol

 clear all
 close all
 clc
 %%%%%%%%%%%%%%%%%
 %QA-a)
%  estimation of integral(x exp(x^2)) in range of 0-1 (this is a Monte
%  Carlso integration)

 n=10000/2;
 U=rand(2*n,1);    % Original simulation method first
 Y=U.*exp(U.^2);
 
 sigmVar=var(Y)
 sigmaMean=mean(Y),
%%%%%%%%%%%%%%%%%%%%%%%
%  %QA-b)
u=rand(n,1);     % Now use n antithetic pairs
v=1-u;
Z=(u.*exp(u.^2) +  v.*exp(v.^2))/2;

sigmVarAntithetic=var(Z)
sigmaMeanAntithetic=mean(Z),

% compute percentage variance reduction
Variance_reduction = (sigmVar/(2*n) - sigmVarAntithetic/n)*100/(sigmVar/(2*n))

% Variance_reduction =   83.3824

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%QB-a)
U=2 + randn(2*n,1);    % First use the raw simulation method
h=U.^3+3*U+2;
 
sigmVar=var(h)
sigmaMean=mean(h),
%%%%%%%%%%%%%%%%
%QB-b)
U=2 + randn(n,1);   % Now use antithetic variates
V=4-U;

h=(U.^3+3*U+2+ V.^3+3*V+2)/2;

sigmVarAntithetic=var(Z)
sigmaMeanAntithetic=mean(Z),

% Now compute the percentage variance reduction
Variance_reduction = (sigmVar/(2*n) - sigmVarAntithetic/n)*100/(sigmVar/(2*n))


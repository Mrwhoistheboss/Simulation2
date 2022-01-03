%q5sol
close all
clear all
clc
%%%%%%%%%%%%%%%%%
%a)
CILevel=0.95;
[X,y,b,bint,r,rint]=q5sim(CILevel,1);

%%%%%%%%%%%%%%%%%
%b)
frV=[];
for kk=1:500
    [X,y,b,bint,r,rint]=q5sim(CILevel,0);
    contain0 = (rint(:,1)<0 & rint(:,2)>0);
    idx = find(contain0==false);
    frV=[frV,length(idx)/length(X)];
end
figure,plot(frV),
frMu=mean(frV)
frVar=var(frV)
%%%%%%%%%%
%c)
CILevel=0.90;
[X,y,b,bint,r,rint]=q5sim(CILevel,0);

frV=[];
for kk=1:500
    [X,y,b,bint,r,rint]=q5sim(CILevel,0);
    contain0 = (rint(:,1)<0 & rint(:,2)>0);
    idx = find(contain0==false);
    frV=[frV,length(idx)/length(X)];
end
figure,plot(frV),
frMu=mean(frV)
frVar=var(frV)
%%%%%%%%%%%%%%%%
%d) yes the result is almost as we expectuded
%why the result of mean does not become exact 0.05 or 0.1 is to that we
%need to run the simulation even more than 500 times (then it will
%converges to the exact expected values)



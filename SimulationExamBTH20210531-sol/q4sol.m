%Q2sol

clear all
close all
clc
%%%%%%%%%%%%%
%a  minimum
%b  maximum
%c  mode

a=0;b=10;
cc=1:9;
NN=30000;
colormap jet
cmap=colormap;

for pp=1:length(cc)
    c=cc(pp);
    Y=[];
    for kk=1:NN
        t = 2/(b-a);
        r = (2/(b-a))/2;%r=t/area, where area becomes 2 (i.e., 0.2*10)   
        accept = 0;
        while accept == 0
            y = unifrnd(a,b);
            U = rand;
            if y <= c
                f = 2*(y-a)/((b-a)*(c-a));
            else
                f = 2*(b-y)/((b-a)*(b-c));
            end
            if U < f*0.5
                accept=1;
            end
        end
        Y=[Y,y];
    end
    plotColor=cmap(round(256/9)*pp,:);
    figure(10),plot(sort(Y),'Color',plotColor,'LineWidth',2),hold on
    [bins,p]=acNhist2(Y);
    figure(100),plot(bins,p,'Color',plotColor,'LineWidth',2);hold on
    grid minor;
    title('Distribution 9of the signal')
end
%%%%%%%%%%%%%%%%%%%%

%appplication
% The triangular distribution is therefore often used in business decision making, 
% particularly in simulations. Generally, when not much is known about the distribution 
% of an outcome (say, only its smallest and largest values), it is possible to use 
% the uniform distribution. But if the most likely outcome is also known, 
% then the outcome can be simulated by a triangular distribution. 


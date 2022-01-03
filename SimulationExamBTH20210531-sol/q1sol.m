%q1sol
clear all
close all
clc
%%%%%%%%%%%%%%%%%%%%%
lambda=7.5;mu=10;endtime=1500;NN=50;%500;
tp=[];
while 1
    if isempty(tp)
        [N,Tm,T,ro]=Q1sim(lambda,mu,endtime);
        figure,plot(ro,'Linewidth',2),title('doubtfull simulation') % if it is fine we get the set up time, otherwise (due bad intial values in simulation) we need to repeat the simulation 
        %%%%%%%%%%%%%%
        % b)the algorithm
        ru=lambda/mu;
        tp=find(ro<=(ru-ru*0.03)| ro>=(ru+ru*0.03));
    else
        figure,plot(ro),title('good simulation')
        setupTime=1:tp(end);
        sytemTime=tp(end):length(ro);
        figure,plot(ro,'k','Linewidth',2),hold on,plot(ro(setupTime),'r','Linewidth',2)
        break;
    end
end
%%%%%%%%%%%%%%%%
% c)
setupTimeV1=[];
count=1;
% NN=500;
while 1
    if count==NN
        break;
    end
    [N,Tm,T,ro]=Q1sim(lambda,mu,endtime);
    ru=lambda/mu;
    tp=find(ro<=(ru-ru*0.03)| ro>=(ru+ru*0.03));
    if ~isempty(tp)
        setupTime=1:tp(end);
        setupTimeV1=[setupTimeV1,length(setupTime)];
        count=count+1;
    end
end
figure,plot(sort(setupTimeV1),'Linewidth',2),hold on
%%%%%%%%%%%%%%%%
% d)
lambda=1.5;
setupTimeV2=[];
count=1;
% NN=500;
while 1
    if count==NN
        break;
    end
    [N,Tm,T,ro]=Q1sim(lambda,mu,endtime);
    ru=lambda/mu;
    tp=find(ro<=(ru-ru*0.03)| ro>=(ru+ru*0.03));
    if ~isempty(tp)
        setupTime=1:tp(end);
        setupTimeV2=[setupTimeV2,length(setupTime)];
        count=count+1;
    end
end
plot(sort(setupTimeV2),'Linewidth',2)
%%%%%%%%%%%%%%%%
% d)
lambda=9.5;
setupTimeV3=[];
count=1;
% NN=500;
while 1
    if count==NN
        break;
    end
    [N,Tm,T,ro]=Q1sim(lambda,mu,endtime);
    ru=lambda/mu;
    tp=find(ro<=(ru-ru*0.03)| ro>=(ru+ru*0.03));
    if ~isempty(tp)
        setupTime=1:tp(end);
        setupTimeV3=[setupTimeV3,length(setupTime)];
        count=count+1;
    end
end
plot(sort(setupTimeV3),'Linewidth',2),ylabel('Setup time')
legend('ru=75%','ru=15%','ru=95%')







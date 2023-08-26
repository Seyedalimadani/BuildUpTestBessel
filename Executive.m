clc;clear;close all
%% Constants
Pi=25; %psi
tp=100; %hr
q=0.5; %bbl/day
B=1; %bbl/STB
mu=1; %cp
k=2; %mD
S=0; %assume rw corrected with skin
h=0.1; %ft
rw=0.005; %ft
re=0.1; %ft
phi=2500; %ft
Ct=2000; %ft
% Calculated Values are for 5 hr after well shut in
% Data time Step is equal 0.1 hr


%% Bessel Solutions
%% Production Stage
initialpartinterval=eps:0.1:tp;
prodpartdata=NaN*ones(numel(initialpartinterval),2);
counter=1;
for dt=initialpartinterval
    prodpartdata(counter,1)=dt;
    s1=dPBessel(q,B,mu,k,h,rw,re,rw,phi,Ct,dt);
    prodpartdata(counter,2)=Pi-s1;
    counter=counter+1;
end
%% Shut in Stage
interval=eps:0.1:5; %start,step,end
Data=NaN*ones(numel(interval),2);
counter=1;
for dt=interval;
    Data(counter,1)=dt;
    s1=dPBessel(q,B,mu,k,h,rw,re,rw,phi,Ct,tp+dt);
    s2=dPBessel(-q,B,mu,k,h,rw,re,rw,phi,Ct,dt);
    sum=s1+s2;
    Data(counter,2)=Pi-sum;
    counter=counter+1;
  
end
%% plot configuration
plot(prodpartdata(:,1),prodpartdata(:,2),'color','r','linewidth',2.5);
hold on;
plot(Data(:,1)+tp,Data(:,2),'color','g','linewidth',2.5);
legend('Production Stage','Shut in Stage')
title('Buildup curve for a bounded Res. Based on Bessel Solution','fontsize',12,'fontweight','b');
xlabel({'t'},'fontsize',17,'fontweight','b');
ylabel({'Pws'},'fontsize',17,'fontweight','b');
set(gca,'fontsize',10);
grid on;




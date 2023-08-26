clc;clear
c=1;
Ans=zeros(201,1);
for t=0:0.5:100
Ans(c,1)=Temp(25,0.5,0.05,2,4e-7,0.3,0.02,0.02,t);
c=c+1;
end
plot(0:0.5:100,Ans)
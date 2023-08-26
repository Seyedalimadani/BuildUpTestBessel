function [T]=Temp(Ti,q,h,TC,TD,re,rw,r,t)
Roots=RootFun(re,rw);
A=Afunction(re,rw,TD,t,r);
B=Bfunction(Roots,TD,rw,re,r,t);
T=Ti+(q./(2*pi*TC*h))*(A+pi*B);
end
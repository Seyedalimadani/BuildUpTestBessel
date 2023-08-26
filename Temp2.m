function [T]=Temp2(Ti,q,h,TC,TD,re,rw,t,Roots)
A=A2function(re,rw);
B=B2function(Roots,TD,rw,rw,t);
T=Ti+(q./(2*pi*TC*h)).*(A-2*B);
end
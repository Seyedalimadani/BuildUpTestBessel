function [B]=Bfunction(Roots,TD,rw,re,r,t)
B=0;
m=1;
reD=re./rw;
rD=r./rw;
while m<=length(Roots)
B1=exp(-Roots(m).^2*(TD*t./(rw.^2)))*besselj(1,Roots(m).*reD).^2;
B2=besselj(1,Roots(m)).*bessely(0,Roots(m).*rD)-bessely(1,Roots(m)).*besselj(0,Roots(m).*rD);
B3=Roots(m).*(besselj(1,Roots(m).*reD).^2-besselj(1,Roots(m)).^2);
AddedB=(B1)*(B2)./(B3);
B=B+AddedB;
m=m+1;
end
function [B]=B2function(Roots,TD,rw,re,t)
B=0;
m=1;
reD=re./rw;
while m<=length(Roots)
B1=exp(-Roots(m).^2*(TD*t./(rw.^2)))*besselj(0,Roots(m).*reD).^2;
B3=Roots(m).^2.*(besselj(1,Roots(m)).^2-besselj(0,Roots(m).*reD).^2);
AddedB=(B1)./(B3);
B=B+AddedB;
m=m+1;
end
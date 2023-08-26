function [A]=Afunction(re,rw,TD,t,r)
reD=re./rw;
rD=r./rw;
tDw=(TD.*t)/(rw.^2);
A1=(2./(reD.^2-1)).*((rD^2./4)+tDw);
A2=(reD.^2.*log(rD))./(reD.^2-1);
A3=(3.*reD.^4-4.*reD.^4.*log(reD)-2.*reD.^2-1)./(4.*(reD.^2-1).^2);
A=A1-A2-A3;
end
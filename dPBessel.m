function [dP]= dPBessel(q,B,mu,k,h,rw,re,r,phi,Ct,t)
rD=r/rw;
reD=re/rw;
tDw=(k*t)/(phi*mu*Ct*rw^2);
ANS = 0*ones(1000,1);      
points=linspace(0,1,1000);
for i=1:1000
    if points(i)~=0
        ANS(i)=fzero(@(x)besselj(1,reD*x)*bessely(1,x)-besselj(1,x)*bessely(1,reD*x),points(i));
    end
        if imag(ANS(i))~=0 ||isnan(ANS(i))
            ANS(i)=0;
        end
end
ANS=sort(unique(real(ANS)));
count=numel(ANS);
firstterm=(q*B*mu)/(k*h)*(((2/(reD^2-1))*(rD^2/4+tDw))-((reD^2*log(rD))/(reD^2-1))-((3*reD^4-4*reD^4*log(reD)-2*reD^2-1)/(4*(reD^2-1)^2)));
secondterm=0;
for a=1:count
    if ANS(a)~=0
        k1=(exp(-(ANS(a)^2)*tDw))*besselj(1,ANS(a)*reD)^2;
        k2=besselj(1,ANS(a))*bessely(0,ANS(a)*rD)-bessely(1,ANS(a))*besselj(0,ANS(a)*rD);
        k3=(besselj(1,ANS(a)*reD))^2-(besselj(1,ANS(a)))^2;
       secondterm=secondterm+(k1*k2)/(ANS(a)*k3);
    end
end
dP=firstterm+((q*B*mu*pi)/(k*h))*secondterm;
end
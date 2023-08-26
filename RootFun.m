function [ANS]=RootFun(re,rw)
reD=re/rw;
ANS = zeros(1000,1);      
points=linspace(0,100,10000);
for i=1:length(points)
    if points(i)~=0
        ANS(i)=fzero(@(x)besselj(1,reD*x)*bessely(1,x)-besselj(1,x)*bessely(1,reD*x),points(i));
    end
        if imag(ANS(i))~=0 ||isnan(ANS(i))
            ANS(i)=0;
        end
end
tolerance = 1e-6;
ANS = round(ANS / tolerance) * tolerance;
ANS=sort(unique(ANS));
if ANS(1,1)==0
    ANS=ANS(2:end,1);
end
end
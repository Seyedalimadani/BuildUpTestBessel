function [ANS]=RootFun2(re,rw)
reD=re/rw;      
points=linspace(0,10000,1e6);
N=length(points);
ANS = zeros(N,1);
for i=1:length(points)
    if points(i)~=0
        ANS(i)=fzero(@(x)besselj(1,x).*bessely(0,x.*reD)-besselj(0,x.*reD).*bessely(1,x),points(i));
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
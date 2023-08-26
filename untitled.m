%syms x
re=3;
rw=0.25;
reD=re/rw;
x=0:0.01:100;
W=besselj(1,reD*x).*bessely(1,x)-besselj(1,x).*bessely(1,reD*x);
plot(x,W)
hold on
scatter(T,q)
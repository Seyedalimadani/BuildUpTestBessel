reD=40;
x=linspace(0,10000,1e6);
w=besselj(1,reD.*x).*bessely(1,x)-besselj(1,x).*bessely(1,reD.*x);
plot(x,w);
hold on;
scatter(Roots,T);
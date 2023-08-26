reD=2.75/0.25;
x=linspace(0,10,100);
w=besselj(1,reD.*x).*bessely(1,x)-besselj(1,x).*bessely(1,reD.*x);
plot(x,w)
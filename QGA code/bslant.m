function bix=bslant(m,q,a,x,r)
w0=m*q*cos(a/180*pi);
bix=w0/r*exp(-pi*(x/r).^2);
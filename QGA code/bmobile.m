function bux=bmobile(m,q,a,x,r,b)
w0=m*q*cos(a/180*pi);
bux=b*w0*exp(-pi*(x/r).^2);
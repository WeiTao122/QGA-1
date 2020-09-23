function bex=bdeformation(m,q,a,x,r,b)
w0=m*q*cos(a/180*pi);
bex=-2*pi*b*w0/r^2*x.*exp(-pi*(x/r).^2);
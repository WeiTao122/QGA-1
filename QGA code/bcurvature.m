function bkx=bcurvature(m,q,a,x,r)
w0=m*q*cos(a/180*pi);
bkx=-2*pi*w0/r^3*x.*exp(-pi*(x/r).^2);
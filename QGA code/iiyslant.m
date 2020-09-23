function iiy=iiyslant(m,q,a,y,L,r,r2)
w0=m*q*cos(a/180*pi);
iiy=w0/r*exp(-pi*((y-L)/r2).^2);
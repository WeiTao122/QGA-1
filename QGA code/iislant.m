function ii=iislant(m,q,a,x,l,r)
w0=m*q*cos(a/180*pi);
ii=w0/r*exp(-pi*((x-l)/r).^2);
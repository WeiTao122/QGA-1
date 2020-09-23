function ee=eedeformation(m,q,a,x,l,r,b)
w0=m*q*cos(a/180*pi);
bex=-2*pi*b*w0/r^2*(x-l).*exp(-pi*((x-l)/r).^2);
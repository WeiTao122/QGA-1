function kk=kkcurvature(m,q,a,x,l,r)
w0=m*q*cos(a/180*pi);
kk=-2*pi*w0/r^3*(x-l).*exp(-pi*((x-l)/r).^2);
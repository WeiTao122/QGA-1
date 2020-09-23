function uu=uumobile(m,q,a,x,l,r,b)
w0=m*q*cos(a/180*pi);
uu=b*w0*exp(-pi*((x-l)/r).^2);
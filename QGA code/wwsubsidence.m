function ww=wwsubsidence(m,q,a,x,l,r)
w0=m*q*cos(a/180*pi);
ww=w0/2*[erf(sqrt(pi)*(x-l)/r)+1];
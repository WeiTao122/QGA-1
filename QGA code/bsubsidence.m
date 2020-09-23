function bwx=bsubsidence(m,q,a,x,r)
w0=m*q*cos(a/180*pi);
bwx=w0/2*[erf(sqrt(pi)*x/r)+1];
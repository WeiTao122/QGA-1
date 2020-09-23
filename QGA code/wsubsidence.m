function w=wsubsidence(m,q,a,y,r1)
w0=m*q*cos(a/180*pi);
w=w0/2*[erf(sqrt(pi)*y/r1)+1];
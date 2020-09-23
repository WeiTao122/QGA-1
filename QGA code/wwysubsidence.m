function wwy=wwysubsidence(m,q,a,y,L,r2)
w0=m*q*cos(a/180*pi);
wwy=w0/2*[erf(sqrt(pi)*(y-L)./r2)+1];
function wxy=subsidence(m,q,a,x,l,y,L,r,r1,r2)
w0=m*q*cos(a/180*pi);
wo=ysubsidence(m,q,a,x,r,l);
woy=woysubsidence(m,q,a,y,r1,r2,L);
wxy=1/w0*wo*woy;
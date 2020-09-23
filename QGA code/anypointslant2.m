function ixy_fai2=anypointslant2(m,q,a,x,l,y,L,r1,r2,r,fai2)
w0=m*q*cos(a/180*pi);
wo=ysubsidence(m,q,a,x,r,l);
io=yslant(m,q,a,x,r,l);
woy=woysubsidence(m,q,a,y,r1,r2,L);
ioy=ioyslant(m,q,a,y,r,r1,r2,L);
ixy_fai2=1/w0*(io.*woy.*cos(fai2*pi/180)+wo.*ioy.*sin(fai2*pi/180));
function ixy_fai1=anypointslant1(m,q,a,x,l,y,L,r1,r2,r,fai1)
w0=m*q*cos(a/180*pi);
wo=ysubsidence(m,q,a,x,r,l);
io=yslant(m,q,a,x,r,l);
woy=woysubsidence(m,q,a,y,r1,r2,L);
ioy=ioyslant(m,q,a,y,r,r1,r2,L);
ixy_fai1=1/w0*(io.*woy.*cos(fai1*pi/180)+wo.*ioy.*sin(fai1*pi/180));
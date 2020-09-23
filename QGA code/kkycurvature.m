function kky=kkycurvature(m,q,a,y,L,r2)
w0=m*q*cos(a/180*pi);
kky=-2*pi*w0/r2^3*(y-L).*exp(-pi*((y-L)/r2).^2);
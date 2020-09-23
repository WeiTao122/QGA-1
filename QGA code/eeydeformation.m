function eey=eeydeformation(m,q,a,y,L,r,r2,b2,j)
w0=m*q*cos(a/180*pi);
bix=slant(m,q,a,x,r);
eey=-2*pi*b2*w0/r2.^2*(y-L).*exp(-pi*((y-L)/r2).^2)+i*cot(j/180*pi)
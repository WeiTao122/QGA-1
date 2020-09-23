function e=edeformation(m,q,a,y,r,r1,b1,j)
w0=m*q*cos(a/180*pi);
bix=slant(m,q,a,x,r);
e=-2*pi*b1*w0/r1.^2*y.*exp(-pi*(y/r1).^2)+j*cot(j/180*pi);
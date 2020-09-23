function i=islant(m,q,a,y,r,r1)
w0=m*q*cos(a/180*pi);
i=w0/r*exp(-pi*(y/r1).^2);
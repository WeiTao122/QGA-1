function k=kcurvature(m,q,a,y,r1)
w0=m*q*cos(a/180*pi);
k=-2*pi*w0/r1^3*y.*exp(-pi*(y/r1).^2);
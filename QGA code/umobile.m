function u=umobile(m,q,a,y,r,r1,b1,j)
w0=m*q*cos(a/180*pi);
bwx=bsubsidence(m,q,a,x,r);
u=b1*w0*exp(-pi*(y./r1).^2)+bwx.*cot(j/180*pi);
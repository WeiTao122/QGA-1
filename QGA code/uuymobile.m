function uuy=uuymobile(m,q,a,y,L,r,r2,b2,j)
w0=m*q*cos(a/180*pi);
bwx=bsubsidence(m,q,a,x,r);
uuy=b1*w0*exp(-pi*((y-L)./r1).^2)+bwx.*cot(j/180*pi);
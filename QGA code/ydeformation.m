function eo=ydeformation(m,q,a,x,r,b,l)
bex=bdeformation(m,q,a,x,r,b);
ee=eedeformation(m,q,a,x-l,r,b);
eo=bex-ee;
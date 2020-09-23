function wo=ysubsidence(m,q,a,x,r,l)
bwx=bsubsidence(m,q,a,x,r);
ww=wwsubsidence(m,q,a,x,l,r);
wo=bwx-ww;

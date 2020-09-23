function io=yslant(m,q,a,x,r,l)
bix=bslant(m,q,a,x,r);
ii=iislant(m,q,a,x,l,r);
io=bix-ii;
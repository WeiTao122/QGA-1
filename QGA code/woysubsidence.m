function woy=woysubsidence(m,q,a,y,r1,r2,L)
w=wsubsidence(m,q,a,y,r1);
wwy=wwysubsidence(m,q,a,y,L,r2);
woy=w-wwy;
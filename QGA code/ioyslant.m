function ioy=ioyslant(m,q,a,y,r,r1,r2,L)
i=islant(m,q,a,y,r,r1);
iiy=iiyslant(m,q,a,y,L,r,r2);
ioy=i-iiy;
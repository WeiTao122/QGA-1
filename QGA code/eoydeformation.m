function eoy=eoydeformation(m,q,a,y,r,r1,r2,L,b1,b2,j)
e=edeformation(m,q,a,y,r,r1,b1,j);
eey=eeydeformation(m,q,a,y,L,r,r2,b2,j);
eoy=e-eey;
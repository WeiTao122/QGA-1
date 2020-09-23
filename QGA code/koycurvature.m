function koy=koycurvature(m,q,a,y,r1,r2,L)
k=kcurvature(m,q,a,y,r1);
kky=kkycurvature(m,q,a,y,L,r2);
koy=k-kky;
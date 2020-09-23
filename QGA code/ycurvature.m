function ko=ycurvature(m,q,a,x,r,l)
bkx=bcurvature(m,q,a,x,r);
kk=kkcurvature(m,q,a,x,l,r);
ko=bkx-kk;
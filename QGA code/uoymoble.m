function uoy=uoymobile(m,q,a,y,L,b1,b2,r,r1,r2,j)
u=umobile(m,q,a,y,r,r1,b1,j);
uuy=uuymobile(m,q,a,y-L,r,r2,b2,j);
uoy=u-uuy;
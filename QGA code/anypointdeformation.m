function exy=anypointdeformation(m,q,a,x,l,y,L,r1,r2,r,fai,b)
kxy=anypointcurvature(m,q,a,x,l,y,L,r1,r2,r,fai);
exy=b*r*kxy;
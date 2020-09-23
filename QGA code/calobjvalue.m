function [f,SMVp,maxf,I,cta1]=calobjvalue(pop,B)
global  Xi Yi a m X0 Y0  pd  SMV q tanB b o su sd sl sr
f=[];SMVp=[];
for i=1:100
    Bc=B(i,:);
    m=Bc(1,1);
    a=Bc(1,2);
    cta=Bc(1,3);
    H=Bc(1,4);
    DL=Bc(1,5);
    Dl=Bc(1,6);
    X0=Bc(1,7);
    Y0=Bc(1,8);
    
    r=H/tanB;
    r1=r;
    r2=r;
    l=Dl-sl-sr;
    L=(DL-su-sd)*sin((o+a)/180*pi)/sin(o/180*pi);
    if cta>=180
        fai1=(cta-90)*ones([pd 1]);
        fai2=cta*ones([pd 1]);
        cta1=cta-180;
    else
%         fai1=(cta+90)*ones([pd 1]);
%         fai2=cta*ones([pd 1]);
        fai1=(cta+90)*ones([pd 1]);
        fai2=(cta-180)*ones([pd 1]);
        cta1=cta;
    end
    N=sqrt(Dl^2+DL^2)/2;
    Xo=X0-N*cos((cta1+180*atan(Dl/DL)/pi-90)/180*pi);
    Yo=Y0+N*sin((cta1+180*atan(Dl/DL)/pi-90)/180*pi);
    x=(Xi-Xo)*cos(cta1/180*pi)-(Yi-Yo)*sin(cta1/180*pi);
    y=(Yi-Yo)*cos(cta1/180*pi)+(Xi-Xo)*sin(cta1/180*pi);
    w0=m*q*cos(a/180*pi);
    wo=ysubsidence(m,q,a,x,r,l);
    woy=woysubsidence(m,q,a,y,r1,r2,L);
    wxy=1/w0.*wo.*woy;
    W1=-wxy*1000;
    ixy_fai1=anypointslant1(m,q,a,x,l,y,L,r1,r2,r,fai1);
    uxy_fai1=b*r*ixy_fai1*1000;
    ixy_fai2=anypointslant2(m,q,a,x,l,y,L,r1,r2,r,fai2);
    uxy_fai2=b*r*ixy_fai2*1000;
    SMVp1=sqrt(W1.^2+uxy_fai1.^2+uxy_fai2.^2);
    f1=sum((SMVp1-SMV).^2);
    f=[f,f1];
    SMVp=[SMVp,SMVp1];
end
f=1./f;
[maxf,I]=max(f);
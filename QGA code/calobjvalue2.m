function [f,W,U,maxf,I,cta1]=calobjvalue2(pop,B,fai,px,Wsi,Usi)
global H0 Xi Yi a m X0 Y0 Ws pd  Us q tanB b o su sd sl sr pz pq gross_position  num_position
f=[];W=[];U=[];
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
        fai1=(cta-90)*ones([pz 1]);
        fai2=cta*ones([pq 1]);
        cta1=cta-180;
    else
        fai1=(cta+90)*ones([pz 1]);
        fai2=cta*ones([pq 1]);
%         fai1=(cta+90)*ones([pz 1]);
%         fai2=(cta+180)*ones([pq 1]);
        cta1=cta;
    end
    fai=[fai1;fai2];
    for jj=1:num_position                %µ„»± ß
        jz=gross_position(1,jj);
        fai(jz,:)=[];
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
    ixy=anypointslant(m,q,a,x,l,y,L,r1,r2,r,fai);
    uxy=b*r*ixy;
    U1=uxy*1000;
    f1=sum(((W1-Wsi).^2+(U1-Usi).^2));
    f=[f,f1];
    W=[W,W1];
    U=[U,U1];
end
f=1./f;
[maxf,I]=max(f);
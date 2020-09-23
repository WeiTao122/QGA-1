function [B0,pd,SMV]=readfile
global gn pz pq pd q tanB b o su sd sl sr X0 Y0  Xi Yi fai1 fai2 guancezhi xuhao C SMV;
 [filename1,pathname1]=uigetfile('*.txt','pick a file for read');
 fid1=fopen(strcat(pathname1,filename1),'rt');
 if (fid1==-1)
     msgbox('choose a wrong file for read','Warning','warn');
     return;
 end  
 gn=fscanf(fid1,'%f',1);
 pz=fscanf(fid1,'%f',1);
 pq=fscanf(fid1,'%f',1);
 q=fscanf(fid1,'%f',1);         %预计参数
 tanB=fscanf(fid1,'%f',1);
 b=fscanf(fid1,'%f',1);
 o=fscanf(fid1,'%f',1);
 su=fscanf(fid1,'%f',1);
 sd=fscanf(fid1,'%f',1);
 sl=fscanf(fid1,'%f',1);
 sr=fscanf(fid1,'%f',1);
 
 m=fscanf(fid1,'%f',1);      %参数初始值
 a=fscanf(fid1,'%f',1);
 cta=fscanf(fid1,'%f',1);
 H=fscanf(fid1,'%f',1);
 DL=fscanf(fid1,'%f',1);
 Dl=fscanf(fid1,'%f',1);
 X0=fscanf(fid1,'%f',1);
 Y0=fscanf(fid1,'%f',1);
 B0=[m,a,cta,H,DL,Dl,X0,Y0];
 
 C=[];
 C(1,1)=fscanf(fid1,'%f',1);   %限值
 C(1,2)=fscanf(fid1,'%f',1);
 C(1,3)=fscanf(fid1,'%f',1);
 C(1,4)=fscanf(fid1,'%f',1);
 C(1,5)=fscanf(fid1,'%f',1);
 C(1,6)=fscanf(fid1,'%f',1);
 C(1,7)=fscanf(fid1,'%f',1);
 C(1,8)=fscanf(fid1,'%f',1);
 
 r=H/tanB;
 r1=r;
 r2=r;
 l=Dl-sl-sr;
 L=(DL-su-sd)*sin((o+a)/180*pi)/sin(o/180*pi);
 pd=pz+pq;
 if cta>=180
     fai1=(cta-90)*ones([pd 1]);
     fai2=cta*ones([pd 1]);
     cta1=cta-180;
 else
%      fai1=(cta+90)*ones([pz 1]);     % 模拟
%      fai2=cta*ones([pq 1]);
     fai1=(cta+90)*ones([pd 1]);   %实测
     fai2=(cta+180)*ones([pd 1]);
     cta1=cta;
 end
 
 P=fscanf(fid1,'%f',[4,pd]);
 
 guancezhi=P';
 Xi=guancezhi(:,2);
 Yi=guancezhi(:,3);
 x=(Xi-X0)*cos(cta1/180*pi)-(Yi-Y0)*sin(cta1/180*pi);
 y=(Yi-Y0)*cos(cta1/180*pi)+(Xi-X0)*sin(cta1/180*pi);
SMV=guancezhi(:,4);
 xuhao=guancezhi(:,1);
 fclose(fid1);
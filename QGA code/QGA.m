clc
global pd   xuhao C SMV 
[B0,pd,SMV]=readfile;
[B,pop,A,px]=bianma(B0,C);
[f,SMVp,maxf,I,cta1]=calobjvalue(pop,B);
gen=1;
d=abs(max(SMV))*0.01;
while gen<=100
if sqrt((1/maxf)/(pd-1))<=d
    fp=f(I);
    popB=pop(I);
    B=B(I,:);
    gen=gen;
    SMVp1=SMVp(:,I);
    break
else
    [B,pop,A]=gate(A,pop,I,f,B0,C);
    [f,SMVp,maxf,I,cta1]=calobjvalue(pop,B);
      gen=gen+1;
    if gen==100
        fp=f(I);
        popB=pop(I);
        B=B(I,:);
        gen=gen; 
        SMVp1=SMVp(:,I);
        break
    else
    end
end
end
m=B(1,1);a=B(1,2);cta=B(1,3);H=B(1,4);DL=B(1,5);Dl=B(1,6);X0=B(1,7);Y0=B(1,8);
N=sqrt(Dl^2+DL^2)/2;
Xo=[X0-N*cos((cta1+180*atan(Dl/DL)/pi-90)/180*pi);X0-N*cos((cta1+90-180*atan(Dl/DL)/pi)/180*pi);X0+N*cos((cta1+180*atan(Dl/DL)/pi-90)/180*pi);X0+N*cos((cta1+90-180*atan(Dl/DL)/pi)/180*pi)];
Yo=[Y0+N*sin((cta1+180*atan(Dl/DL)/pi-90)/180*pi);Y0+N*sin((cta1+90-180*atan(Dl/DL)/pi)/180*pi);Y0-N*sin((cta1+180*atan(Dl/DL)/pi-90)/180*pi);Y0-N*sin((cta1+90-180*atan(Dl/DL)/pi)/180*pi)];

v=sqrt((1/fp)/(pd-1));
figure(1)
plot(xuhao,SMVp1,'b*-',xuhao,SMV,'r-');
SMV_dif=[SMVp1,SMV];
figure(2)
bar(SMV_dif)

disp(gen)
disp(v)
disp(B)

[filename1,pathname1]=uigetfile('D:\datafile\Results_QGA.txt');
fid1=fopen(strcat(pathname1,filename1),'wt');
if (fid1==-1)
   msgbox('choose a wrong file for read','Warning','warn');
   return
end  
fprintf(fid1,'参数：\nm  a  cta  H0  DL  Dl  X0  Y0 v\n');
fprintf(fid1,'%8.4f %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f\n',[B,v]');
fclose(fid1);
open(strcat(pathname1,filename1));
[filename1,pathname1]=uigetfile('D:\datafile\Results_QGA.txt');
fid1=fopen(strcat(pathname1,filename1),'wt');
if (fid1==-1)
   msgbox('choose a wrong file for read','Warning','warn');
   return
end  
fprintf(fid1,'参数：\nm  a  cta  H0  DL  Dl  X0  Y0 v\n');
fprintf(fid1,'%8.4f %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f\n',[B,v]');
fclose(fid1);
open(strcat(pathname1,filename1));
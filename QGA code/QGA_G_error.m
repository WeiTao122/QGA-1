clc
global pd  fai xuhao C SMV  
[B0,pd,Ws,Us]=readfile_error;
SMVz=[];fz=[];Bz=[];vz=[];
for j=1:1:50
    num_position=round(0.8*pd);  %粗差数量
    gross_position=randperm(pd);
    gross_position=gross_position(1,1:num_position);  %粗差位置
    Wsi=Ws;Usi=Us;
    gross_Ws=0.1*min(Wsi);  %矢量粗差值
    for jj=1:num_position                %粗差值替换实测值中的正常值
        jz=gross_position(1,jj);
        Wsi(jz,1)=Wsi(jz,1)+gross_Ws;
    end
    SMVi=sqrt(Wsi.^2+Usi.^2);
    [B,pop,A,px]=bianma(B0,C);
    [f,SMVp,maxf,I,cta1]=calobjvalue1(pop,B,fai,px,SMVi);
    gen=1;
    d=abs(max(SMVi))*0.01;
    while gen<=100
        if sqrt((1/maxf)/(pd-1))<=80
            fp=f(I);
            v=sqrt((1/fp)/(pd-1));
            popB=pop(I);
            B=B(I,:);
            gen=gen;
            SMVp1=SMVp(:,I);
            break
        else
            [B,pop,A]=gate(A,pop,I,f,B0,C);
            [f,SMVp,maxf,I,cta1]=calobjvalue1(pop,B,fai,px,SMVi);
            gen=gen+1;
            if gen==100
                fp=f(I);
                v=sqrt((1/fp)/(pd-1));
                popB=pop(I);
                B=B(I,:);
                gen=gen; 
                SMVp1=SMVp(:,I);
                break
            else
            end
        end
    end
    SMVz=[SMVz,SMVp1];
    
    Bz=[Bz;B];
    vz=[vz;v];
end
disp(Bz)
disp(vz)
[filename1,pathname1]=uigetfile('D:\datafile\Results_QGA_G_error.txt');
fid1=fopen(strcat(pathname1,filename1),'wt');
if (fid1==-1)
   msgbox('choose a wrong file for read','Warning','warn');
   return
end  
fprintf(fid1,'参数：\nm  a  cta  H0  DL  Dl  X0  Y0 v\n');
fprintf(fid1,'%8.4f %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f\n',[Bz,vz]');
fclose(fid1);
open(strcat(pathname1,filename1));

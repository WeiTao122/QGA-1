clc
global pd  pd   xuhao C SMV   
[B0,pd,SMV]=readfile;
SMVz=[];fz=[];Bz=[];vz=[];
for j=1:1:50
    [B,pop,A,px]=bianma(B0,C);
    [f,SMVp,maxf,I,cta1]=calobjvalue(pop,B);
    gen=1;
    d=abs(max(SMV))*0.01;
    while gen<=100
        if sqrt((1/maxf)/(pd-1))<=10
            fp=f(I);
            v=sqrt((1/fp)/(pd-1));
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
[filename1,pathname1]=uigetfile('D:\datafile\Results_QGA_accuracy.txt');
fid1=fopen(strcat(pathname1,filename1),'wt');
if (fid1==-1)
   msgbox('choose a wrong file for read','Warning','warn');
   return
end  
fprintf(fid1,'²ÎÊý£º\nm  a  cta  H0  DL  Dl  X0  Y0 v\n');
fprintf(fid1,'%8.4f %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f\n',[Bz,vz]');
fclose(fid1);
open(strcat(pathname1,filename1));
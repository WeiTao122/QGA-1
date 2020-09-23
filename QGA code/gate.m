function [B,pop,A]=gate(A,pop,I,f,B0,C)
%量子门转换
dt0=-0.01;
for i=1:100
    popi=pop(i,:);
    popb=pop(I,:);
    for j=1:56
        if popi(1,j)==0 && popb(1,j)==0
            cti=0;
        elseif popi(1,j)==0 && popb(1,j)==1
            if f(i)<f(I) &&  A((i-1)*2+1,j)*A(i*2,j)>0
               cti=dt0*pi;
            elseif f(i)<f(I) &&  A((i-1)*2+1,j)*A(i*2,j)<0
                cti=-dt0*pi;
            elseif f(i)<f(I) && A((i-1)*2+1,j)==0
                cti=0;
            elseif f(i)<f(I) && A(i*2,j)==0
                cti=dt0*pi;
            elseif f(i)>=f(I) && A((i-1)*2+1,j)*A(i*2,j)>0
                cti=-dt0*pi;
            elseif f(i)>=f(I) && A((i-1)*2+1,j)*A(i*2,j)<0
                cti=dt0*pi;
            elseif f(i)>=f(I) && A((i-1)*2+1,j)==0
                cti=dt0*pi;
            elseif f(i)>=f(I) && A(i*2,j)==0
                cti=0;
            end
        elseif popi(1,j)==1 && popb(1,j)==0 && f(i)<f(I)
            if A((i-1)*2+1,j)*A(i*2,j)>0
                cti=-dt0*pi;
            elseif A((i-1)*2+1,j)*A(i*2,j)<0
                cti=dt0*pi;
            elseif A((i-1)*2+1,j)==0
                cti=dt0*pi;
            elseif A(i*2,j)==0
                cti=0;
            end
        elseif popi(1,j)==1 && popb(1,j)==1 
             cti=0;
        elseif popi(1,j)==1 && popb(1,j)==0 &&  f(i)>=f(I)
            if A((i-1)*2+1,j)*A(i*2,j)>0
                cti=dt0*pi;
            elseif A((i-1)*2+1,j)*A(i*2,j)<0
                cti=-dt0*pi;
            elseif A((i-1)*2+1,j)==0
                cti=0;
            elseif A(i*2,j)==0
                cti=dt0*pi;
            end
        end
       A((i-1)*2+1,j)=A((i-1)*2+1,j)*cos(cti)-A(i*2,j)*sin(cti);
       A(i*2,j)=A((i-1)*2+1,j)*sin(cti)+A(i*2,j)*cos(cti);
    end
end
%产生新的种群
for i=1:100
    for j=1:56
        rnd=rand(1);
        if (A((i-1)*2+1,j))^2>=rnd
            pop(i,j)=1;
        else
            pop(i,j)=0;
        end
    end
end
pop=pop;
%二进制转十进制
j=0;
py1=56;
length=7;
for i=1:7:(py1-6)
pop1=pop(:,i:i+length-1);
[px,py]=size(pop1);
for i=1:py
    pop1(:,i)=2.^(py-i).*pop1(:,i);
end
j=j+1;
pop2(:,j)=sum(pop1,2);
end
B=zeros(100,8);
for j=1:8
Bi=pop2(:,j);
Bc=B0(1,j);
Ci=C(1,j);
for i=1:100
    if Bi(i,1)<64
       By=Bc-(Ci-(Bi(i,1)*Ci/64));
    else
       By=Bc+(Bi(i,1)-64)*Ci/64;
    end
    Bi(i,1)=By;
end
B(:,j)=Bi;
end
B=B;
            
            
            
    
    
    
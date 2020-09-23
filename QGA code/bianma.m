function [B,pop,A,px]=bianma(B0,C)
length=7;
A=ones(200,56)*(1/sqrt(2));%控制初始种群的大小
Ao=A(1:2,:);
[px,py]=size(A);
pop=[];
for ii=1:(px/2)
    for i=1:py
        temp=rand(1);
        if (Ao(1,i))^2>=temp
           popi(i)=1;
        else
            popi(i)=0;
        end
    end
    pop=[pop,popi'];
end
pop=pop';
j=0;
for i=1:7:(py-6)
pop1=pop(:,i:i+length-1);
[px,py]=size(pop1);
for i=1:py
    pop1(:,i)=2.^(py-i).*pop1(:,i);
end
j=j+1;
pop2(:,j)=sum(pop1,2);
end
B=zeros(px,8);
for j=1:8
Bi=pop2(:,j);
Bc=B0(1,j);
Ci=C(1,j);
for i=1:px
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
    

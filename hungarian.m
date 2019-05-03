%Hungarian Agorithm
%输入A为方阵，输出G为变换完成之后的方阵。
function G=hungarian(A)
[m,n]=size(A);
a = min(A')';%每一行最小的减
A = A-a;%
b = min(A);
A = A-b;
[x,y,t]=zerocover(A);
while t ~= n
     B=A;
     B(x,:)=[];
     B(:,y)=[];
     m=min(min(B));
     A(x,:)=A(x,:)+m;
     A(:,y)=A(:,y)+m;
     m_all=min(min(A));
     A=A-m_all;
     [x,y,t]=zerocover(A);
end
G=A;
end
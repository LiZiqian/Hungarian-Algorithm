%Hungarian Agorithm
%����AΪ�������GΪ�任���֮��ķ���
function G=hungarian(A)
[m,n]=size(A);
a = min(A')';%ÿһ����С�ļ�
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
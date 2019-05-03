%zerocover
%这个程序要把方阵中带有零的行和列划去同时使划去的行和列总数最小。
%x是要划去行的行数，y是要划去的列的列数，t为总共划去了多少行和列。
function [x,y,t]=zerocover(A)
[m,n]=size(A);
if m~=n
    error('A应为方阵');
end
if min(min(A))>0
    error('A中要有0元素');
end

[a,b]=find(A==0);
a=unique(a);
b=unique(b);
upper=min(length(a),length(b));
for k = 1 : upper
    flagk=0;
    for i = 0 : k            
        flagi=0;
        
        u=nchoosek(a,i);
        [nu,~]=size(u);
        j=k-i;
        v=nchoosek(b,j);
        [nv,~]=size(v);
        if i ==0
            for d = 1:nv
                B=A;
                
                B(:,v(d,:))=[];
                if min(min(B))~=0
                    x=[];
                    y=v(d,:);
                    flagi=1;
                    break;
                end
             end
        else%接主程序
            for c = 1 : nu
                flagc=0;
                if min(size(v))==0%原来是nv
                    B=A;
                    B(u(c,:),:)=[];
                    if min(min(B))~=0
                        x=u(c,:);
                        y=[];
                        flagi=1;
                        break;
                    end
                else
                    for d = 1:nv
                        B=A;
                        B(u(c,:),:)=[];
                        B(:,v(d,:))=[];
                        if min(min(B))~=0
                            x=u(c,:);
                            y=v(d,:);
                            flagc=1;
                            break;
                        end
                    end
                end
                if flagc ==1
                    flagi = 1;
                    break;
                end
            end                                 
        end    
        if flagi == 1
            flagk = 1;
            break;
        end        
    end
    if flagk ==1
        break;
    end
end
t=length(x)+length(y);

end




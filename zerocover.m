%zerocover
%�������Ҫ�ѷ����д�������к��л�ȥͬʱʹ��ȥ���к���������С��
%x��Ҫ��ȥ�е�������y��Ҫ��ȥ���е�������tΪ�ܹ���ȥ�˶����к��С�
function [x,y,t]=zerocover(A)
[m,n]=size(A);
if m~=n
    error('AӦΪ����');
end
if min(min(A))>0
    error('A��Ҫ��0Ԫ��');
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
        else%��������
            for c = 1 : nu
                flagc=0;
                if min(size(v))==0%ԭ����nv
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




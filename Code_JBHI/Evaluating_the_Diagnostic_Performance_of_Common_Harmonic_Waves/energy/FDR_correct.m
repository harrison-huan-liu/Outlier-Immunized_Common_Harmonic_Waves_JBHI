% 基于BH法的FDR校正
function [q,index,temp,q_correct]=FDR_correct(p)
[p_order,index]=sort(p);
n=size(p_order,1);
q=zeros(n,1);
for i=1:n
    q(i)=p_order(i)*n*50/i;
end
% FDR=zeros(n,1);
for i=n-1:-1:2
    if q(i)<q(i-1)
        q(i-1)=q(i);
    end
end
temp=0;
for i=1:n
    if p_order(i)<=0.0002*i/n
        temp=i;
    end
end
q_correct=zeros(n,1);
for i=1:n
    q_correct(i)=q(index(i));
end
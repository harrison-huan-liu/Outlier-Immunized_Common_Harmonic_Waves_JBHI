function fisher_score=fisher_score_cL(Energy_CN,Energy_LMCI)
fisher_score=zeros(60,1);
n=zeros(2,1);
n(1,1)=size(Energy_CN,1);
n(2,1)=size(Energy_LMCI,1);
n(3,1)=size(Energy_EMCI,1);

mean_feature=zeros(60,1);
% feature_v1=zeros(60,1);
% feature_v2=zeros(60,1);
% feature_v3=zeros(60,1);
feature_v1=mean(Energy_CN);
feature_v2=mean(Energy_LMCI);
feature_v3=mean(Energy_EMCI);
for i=1:60
    mean_feature(i,1)=(feature_v1(1,i)*n(1,1)+feature_v2(1,i)*n(2,1)+feature_v3(1,i)*n(3,1))/(n(1,1)+n(2,1)+n(3,1));
end

miu=zeros(60,3);
miu(:,1)=(feature_v1(1,:))';
miu(:,2)=(feature_v2(1,:))';
miu(:,3)=(feature_v3(1,:))';

beta=zeros(60,3);
beta(:,1)=(var(Energy_CN))';
beta(:,2)=(var(Energy_LMCI))';
beta(:,3)=(var(Energy_EMCI))';

% cal fisher score
for i=1:60
    temp1=0;
    temp2=0;
    for j=1:3
        temp1=temp1+n(j,1)*(miu(i,j)-mean_feature(i,1))*(miu(i,j)-mean_feature(i,1));
        temp2=temp2+n(j,1)*beta(i,j);
    end
    temp=temp1/temp2;
    fisher_score(i,1)=temp;
end
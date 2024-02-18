p=zeros(148,60);
% observeddifference=zeros(148,60);
% effectsize=zeros(148,60);
sample1=zeros(50,8880);
sample2=zeros(50,8880);
pp=60;% p is the number of eignvectors %55
Graph=Preprocess_data_np_noTransM_01('Data\DataTS-processed.csv',pp);
% Graph=Preprocess_data_np_noTransM_01('Data\DataTS-processed_1.csv',pp);
common_a=cell(5,1);
common_b=cell(5,1);

for rep=1:50
    SubjectNum=80;% 36
    NodeNum=size(Graph(1).W,1);
    CommonNetwork1=zeros(NodeNum,pp);
    CommonNetwork2=zeros(NodeNum,pp);
    select=randperm(94,SubjectNum);% 36
    for i=1:SubjectNum-10
        CommonNetwork1=CommonNetwork1+Graph(select(i)).Phi{1};
    end
    CommonNetwork1=CommonNetwork1/(SubjectNum-10);
    
    for i=1:SubjectNum-20
        CommonNetwork2=CommonNetwork2+Graph(select(i)).Phi{1};
    end
    for i=SubjectNum-9:SubjectNum
        CommonNetwork2=CommonNetwork2+Graph(select(i)).Phi{1};
    end
    CommonNetwork2=CommonNetwork2/(SubjectNum-10);
    
    common_a{rep}=CommonNetwork1;
    common_b{rep}=CommonNetwork2;
%     eval(['common_a_',num2str(i),'=CommonNetwork1;']);
%     eval(['common_b_',num2str(i),'=CommonNetwork2;']);
end
for j=1:8880
    m=floor((j-1)/60);
    n=j-60*m;
    for i=1:50
        sample1(i,j)=common_a{i}(m+1,n);
        sample2(i,j)=common_b{i}(m+1,n);
%         eval(['sample1(i,j)=common_a_',num2str(i),'(m+1,n);']);
%         eval(['sample2(i,j)=common_b_',num2str(i),'(m+1,n);']);
    end
    [p(m+1,n), ~, ~]=permutationTest(sample1(:,j)', sample2(:,j)', 1000);
end
p1=sum(p,2);
p2=zeros(148,60);
for i=1:148
    for j=1:60
        if p(i,j)>0.1
            p2(i,j)=0;
        else
            p2(i,j)=1;
        end
    end
end
p3=sum(p2,2);
fid=fopen('p_value_new2.txt','wt');
fprintf(fid,'%g\n',p3);
fclose(fid);
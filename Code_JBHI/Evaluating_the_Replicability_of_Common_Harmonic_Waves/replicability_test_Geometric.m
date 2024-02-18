p=zeros(148,60);
% observeddifference=zeros(148,60);
% effectsize=zeros(148,60);
sample1=zeros(50,8880);
sample2=zeros(50,8880);
common_a=cell(5,1);
common_b=cell(5,1);

for i=1:50
    filename1=['results\',num2str(i),'_a_com_phi.mat'];
    filename2=['results\',num2str(i),'_b_com_phi.mat'];
    common_a{i}=load(filename1);
    common_b{i}=load(filename2);
%     eval(['common_a_',num2str(i),'=load(filename1)']);
%     eval(['common_b_',num2str(i),'=load(filename2)']);
end
for j=1:8880
    m=floor((j-1)/60);
    n=j-60*m;
    for i=1:50
        sample1(i,j)=common_a{i}{5,1}(m+1,n);
        sample2(i,j)=common_b{i}{5,1}(m+1,n);
%         eval(['sample1(i,j)=common_a_',num2str(i),'{5,1}(m,n)']);
%         eval(['sample2(i,j)=common_b_',num2str(i),'{5,1}(m,n)']);
    end
    [p(m,n), ~, ~]=permutationTest(sample1(:,j)', sample2(:,j)', 1000);
end
% p1=sum(p,2);
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
fid=fopen('p_value_new.txt','wt');
fprintf(fid,'%g\n',p3);
fclose(fid);

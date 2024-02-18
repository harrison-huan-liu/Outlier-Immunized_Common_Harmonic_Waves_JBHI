clear
clc
%% common
p=60;% p is the number of eignvectors %60
Graph=Preprocess_data_np_noTransM_01('../Data/DataTS-processed.csv',p);
m=size(Graph,2);
n=size(Graph(1).L,1);
A=cell(m,1);
beta=0.01;
gama=1;
C=zeros(n,n);

for i=1:m
    A{i}=Graph(i).L;
end

looplimita=1;
er_a=1;
ind_phi_a=cell(94,2);
lastcom_phi_a=cell(2,1);
com_phi_a=cell(2,2);
obj_cost=cell(2,1);
obj_cost_a=cell(2,1);
obj_cost_b=cell(2,1);
test3=cell(2,1);
test4=cell(94,2);
Q=cell(2,1);
R=cell(2,1);
AA=cell(2,1);
BC=cell(2,1);
ina=cell(2,1);
m1=cell(2,1);
err_as=cell(2,1);
    
for i=1:m
    C=C+A{i};
end
[B,~]=eig(C/m);
B=B(:,1:p);

lastcom_phi_a{1,1}=B;

for i=1:m
    [H,~]=eig(A{i});
    ind_phi_a{i,1}=H(:,1:p);
end

obj_cost{1,1}=0;
obj_cost_a{1,1}=0;
obj_cost_b{1,1}=0;
for i=1:m
    obj_cost_a{1,1}=obj_cost_a{1,1}+trace(ind_phi_a{i,looplimita}.'*A{i}*ind_phi_a{i,looplimita});
    obj_cost_b{1,1}=obj_cost_b{1,1}+beta*sqrt(trace(eye(p)-ind_phi_a{i,looplimita}.'*lastcom_phi_a{looplimita,1}));
end
obj_cost{1,1}=obj_cost{1,1}+obj_cost_a{1,1}+obj_cost_b{1,1};

tic

while er_a>0.0000001&&looplimita<=10
    err_a=1;
    looplimitb=1;

    [ind_phi_a(:,looplimita+1)]=calculate_individual(p, m, n, ind_phi_a(:,looplimita), A, lastcom_phi_a{looplimita,1}, beta);
    com_phi_a{looplimitb,looplimita}=ind_phi_a{randi(m),looplimita+1};

    looplimita=looplimita+1;

    while err_a>0.0000001&&looplimitb<100
        increment1=zeros(n,p);
        increment2=zeros(n,p);
        increment_a=zeros(n,p);
        increment_b=zeros(n,p);

        for i=1:m
            m1{looplimitb,i}=trace(eye(p)-ind_phi_a{i,looplimita}.'*com_phi_a{looplimitb,looplimita-1});
            if m1{looplimitb,i}<0.1
                tongji=tongji+1;
            else
                increment_a=increment_a+(com_phi_a{looplimitb,looplimita-1}*ind_phi_a{i,looplimita}.'*com_phi_a{looplimitb,looplimita-1}-ind_phi_a{i,looplimita})/sqrt(m1{looplimitb,i});
            end
        end
        increment_a=-gama*beta*increment_a;
        ina{looplimitb,looplimita-1}=increment_a;

        [Q{looplimitb,looplimita-1},R{looplimitb,looplimita-1}]=qr((eye(n)-com_phi_a{looplimitb,looplimita-1}*com_phi_a{looplimitb,looplimita-1}.')*increment_a,0);
        AA{looplimitb,looplimita-1}=com_phi_a{looplimitb,looplimita-1}.'*increment_a;
        BC{looplimitb,looplimita-1}=expm([AA{looplimitb,looplimita-1},-R{looplimitb,looplimita-1}';R{looplimitb,looplimita-1},zeros(p)])*[eye(p);zeros(p)];
        lastcom_phi_a{looplimita,1}=com_phi_a{looplimitb,looplimita-1}*BC{looplimitb,looplimita-1}(1:p,:)+Q{looplimitb,looplimita-1}*BC{looplimitb,looplimita-1}(p+1:2*p,:);
        lastcom_phi_a{looplimita,1}=lastcom_phi_a{looplimita,1}(:,1:p);
        err_a=norm(increment_a,'fro');
        err_as{looplimitb,looplimita-1}=err_a;
        com_phi_a{looplimitb+1,looplimita-1}=lastcom_phi_a{looplimita,1};

        looplimitb=looplimitb+1;
    end

    obj_cost{looplimita,1}=0;
    obj_cost_a{looplimita,1}=0;
    obj_cost_b{looplimita,1}=0;
    for i=1:m
        m4=trace(eye(p)-ind_phi_a{i,looplimita}.'*lastcom_phi_a{looplimita,1});
        obj_cost_a{looplimita,1}=obj_cost_a{looplimita,1}+trace(ind_phi_a{i,looplimita}.'*A{i}*ind_phi_a{i,looplimita});
        obj_cost_b{looplimita,1}=obj_cost_b{looplimita,1}+beta*sqrt(m4);
    end
    obj_cost{looplimita,1}=obj_cost_a{looplimita,1}+obj_cost_b{looplimita,1};
    er_a=abs(obj_cost{looplimita,1}-obj_cost{looplimita-1,1});
end

toc

filename1=('..\results\a_com_phi.mat');
save(filename1,'lastcom_phi_a');
filename2=('..\results\a_com_phi_m.mat');
save(filename2,'com_phi_a');
filename3=('..\results\a_ind_phi_m.mat');
save(filename3,'ind_phi_a');
filename4=('..\results\obj_cost.mat');
save(filename4,'obj_cost');
filename5=('..\results\obj_cost_a.mat');
save(filename5,'obj_cost_a');
filename6=('..\results\obj_cost_b.mat');
save(filename6,'obj_cost_b');
filename7=('..\results\err_as.mat');
save(filename7,'err_as');

function [Energy_CN,Energy_LMCI,Energy_EMCI,alpha_CN_square_norm,alpha_LMCI_square_norm,alpha_EMCI_square_norm]=Energy_Cal(CN_data,LMCI_data,EMCI_data,filename)
% filename=('..\results\a_com_phi.mat');% ..\result\Phi.mat
temp=struct2cell(load(filename));
common_arithmetric=temp{1,1}{end,1};

CN_nums=size(CN_data,2);
LMCI_nums=size(LMCI_data,2);
EMCI_nums=size(EMCI_data,2);

alpha_CN=zeros(CN_nums,60);
alpha_LMCI=zeros(LMCI_nums,60);
alpha_EMCI=zeros(EMCI_nums,60);

alpha_CN_square=zeros(CN_nums,60);
alpha_LMCI_square=zeros(LMCI_nums,60);
alpha_EMCI_square=zeros(EMCI_nums,60);

for s=1:CN_nums
    for i=2:60
        alpha_CN(s,i)=dot(CN_data(:,s),common_arithmetric(:,i));
        alpha_CN_square(s,i)=alpha_CN(s,i)*alpha_CN(s,i);
    end
end
for s=1:LMCI_nums
    for i=2:60
        alpha_LMCI(s,i)=dot(LMCI_data(:,s),common_arithmetric(:,i));
        alpha_LMCI_square(s,i)=alpha_LMCI(s,i)*alpha_LMCI(s,i);
    end
end
for s=1:EMCI_nums
    for i=2:60
        alpha_EMCI(s,i)=dot(EMCI_data(:,s),common_arithmetric(:,i));
        alpha_EMCI_square(s,i)=alpha_EMCI(s,i)*alpha_EMCI(s,i);
    end
end
% alpha_CN_square_norm=Energy_norm(alpha_CN_square);
% alpha_LMCI_square_norm=Energy_norm(alpha_LMCI_square);
% alpha_EMCI_square_norm=Energy_norm(alpha_EMCI_square);
alpha_CN_square_norm=alpha_CN_square;
alpha_LMCI_square_norm=alpha_LMCI_square;
alpha_EMCI_square_norm=alpha_EMCI_square;
% Energy_CN=sum(alpha_CN_square_norm,2);
% Energy_LMCI=sum(alpha_LMCI_square_norm,2);
% Energy_EMCI=sum(alpha_EMCI_square_norm,2);
Energy_CN=sum(alpha_CN_square,2);
Energy_LMCI=sum(alpha_LMCI_square,2);
Energy_EMCI=sum(alpha_EMCI_square,2);

% Energy_CN_harmonic=sum(alpha_CN_square);
% Energy_LMCI_harmonic=sum(alpha_LMCI_square);
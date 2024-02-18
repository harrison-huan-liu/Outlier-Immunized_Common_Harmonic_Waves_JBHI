% accuracy_amy_ave=zeros(100,5);
% accuracy_amy_var=zeros(100,5);
% accuracy_my_amy_ave=zeros(100,5);
% accuracy_my_amy_var=zeros(100,5);
% 
% accuracy_tau_ave=zeros(100,5);
% accuracy_tau_var=zeros(100,5);
% accuracy_my_tau_ave=zeros(100,5);
% accuracy_my_tau_var=zeros(100,5);
% 
% accuracy_fdg_ave=zeros(100,5);
% accuracy_fdg_var=zeros(100,5);
% accuracy_my_fdg_ave=zeros(100,5);
% accuracy_my_fdg_var=zeros(100,5);

f_select1=cell(2,1);
f_select2=cell(2,1);
f_select3=cell(2,1);
f_select4=cell(2,1);
f_select5=cell(2,1);
f_select6=cell(2,1);

% SVMModel=cell(2,2);
%% amyloid
[AD_amy,CN_amy,EMCI_amy,LMCI_amy,SMC_amy]= Proprocess_original_Amyloid_data('..\Data\signal_Data\Amyloid_SUVR.xlsx');
CN_amy_data_reduce=CN_amy.Amyloid;
LMCI_amy_data_reduce=LMCI_amy.Amyloid;

accuracy_amy=cell(2,1);
accuracy_my_amy=cell(2,1);
Objectnums_amy=cell(2,2);

for i=1:1000
    Objectnums_CN=size(CN_amy_data_reduce,2);
    Objectnums_LMCI=size(LMCI_amy_data_reduce,2);
    Objectnums_more=max(Objectnums_CN,Objectnums_LMCI);
    Objectnums_less=min(Objectnums_CN,Objectnums_LMCI);
    select_CN_LMCI_same=randperm(Objectnums_more,Objectnums_less);
    Objectnums_reduce=2*Objectnums_less;
    select=randperm(Objectnums_reduce,Objectnums_reduce);
    
    [Objectnums_amy{i,1},accuracy_amy{i,1},accuracy_my_amy{i,1}]=Classification_Fourier_end(CN_amy_data_reduce,LMCI_amy_data_reduce,'..\results\0.1_com_phi.mat',select_CN_LMCI_same,select);
    [Objectnums_amy{i,2},accuracy_amy{i,2},accuracy_my_amy{i,2}]=Classification_Fourier_end(CN_amy_data_reduce,LMCI_amy_data_reduce,'..\result\Phi.mat',select_CN_LMCI_same,select);
    [Objectnums_amy{i,3},accuracy_amy{i,3},accuracy_my_amy{i,3}]=Classification_original(CN_amy_data_reduce,LMCI_amy_data_reduce,select_CN_LMCI_same,select);
    [Objectnums_amy{i,4},accuracy_amy{i,4},accuracy_my_amy{i,4}]=Classification_Fourier(CN_amy_data_reduce,LMCI_amy_data_reduce,'..\result\arithmetric_Phi.mat',select_CN_LMCI_same,select);
    [Objectnums_amy{i,5},accuracy_amy{i,5},accuracy_my_amy{i,5}]=Classification_Fourier(CN_amy_data_reduce,LMCI_amy_data_reduce,'..\result\pseudo_Phi.mat',select_CN_LMCI_same,select);
end

%% Tau
[AD_tau,CN_tau,EMCI_tau,LMCI_tau,SMC_tau]= Proprocess_original_Tau_data('..\Data\signal_Data\Tau_SUVR.xlsx');
CN_tau_data_reduce=CN_tau.Tau;
LMCI_tau_data_reduce=LMCI_tau.Tau;
AD_tau_data_reduce=AD_tau.Tau;

% combine LMCI and AD
com_tau_num_LMCI=size(LMCI_tau_data_reduce,2);
com_tau_num_AD=size(AD_tau_data_reduce,2);
for i=1:com_tau_num_AD
    LMCI_tau_data_reduce(:,com_tau_num_LMCI+i)=AD_tau_data_reduce(:,i);
end

accuracy_tau=cell(2,1);
accuracy_my_tau=cell(2,1);
Objectnums_tau=cell(2,2);

for i=1:1000
    Objectnums_CN=size(CN_tau_data_reduce,2);
    Objectnums_LMCI=size(LMCI_tau_data_reduce,2);
    Objectnums_more=max(Objectnums_CN,Objectnums_LMCI);
    Objectnums_less=min(Objectnums_CN,Objectnums_LMCI);
    select_CN_LMCI_same=randperm(Objectnums_more,Objectnums_less);
    Objectnums_reduce=2*Objectnums_less;
    select=randperm(Objectnums_reduce,Objectnums_reduce);
    
    [Objectnums_tau{i,1},accuracy_tau{i,1},accuracy_my_tau{i,1}]=Classification_Fourier_end(CN_tau_data_reduce,LMCI_tau_data_reduce,'..\results\0.002_com_phi.mat',select_CN_LMCI_same,select);
    [Objectnums_tau{i,2},accuracy_tau{i,2},accuracy_my_tau{i,2}]=Classification_Fourier_end(CN_tau_data_reduce,LMCI_tau_data_reduce,'..\result\Phi.mat',select_CN_LMCI_same,select);
    [Objectnums_tau{i,3},accuracy_tau{i,3},accuracy_my_tau{i,3}]=Classification_original(CN_tau_data_reduce,LMCI_tau_data_reduce,select_CN_LMCI_same,select);
    [Objectnums_tau{i,4},accuracy_tau{i,4},accuracy_my_tau{i,4}]=Classification_Fourier(CN_tau_data_reduce,LMCI_tau_data_reduce,'..\result\arithmetric_Phi.mat',select_CN_LMCI_same,select);
    [Objectnums_tau{i,5},accuracy_tau{i,5},accuracy_my_tau{i,5}]=Classification_Fourier(CN_tau_data_reduce,LMCI_tau_data_reduce,'..\result\pseudo_Phi.mat',select_CN_LMCI_same,select);
end

%% FDG
[AD_fdg,CN_fdg,EMCI_fdg,LMCI_fdg,SMC_fdg]= Proprocess_original_FDG_data('..\Data\signal_Data\FDG_SUVR.xlsx');
CN_fdg_data_reduce=CN_fdg.FDG;
LMCI_fdg_data_reduce=LMCI_fdg.FDG;

accuracy_fdg=cell(2,1);
accuracy_my_fdg=cell(2,1);
Objectnums_fdg=cell(2,2);

for i=1:1000
    Objectnums_CN=size(CN_fdg_data_reduce,2);
    Objectnums_LMCI=size(LMCI_fdg_data_reduce,2);
    Objectnums_more=max(Objectnums_CN,Objectnums_LMCI);
    Objectnums_less=min(Objectnums_CN,Objectnums_LMCI);
    select_CN_LMCI_same=randperm(Objectnums_more,Objectnums_less);
    Objectnums_reduce=2*Objectnums_less;
    select=randperm(Objectnums_reduce,Objectnums_reduce);
    
    [Objectnums_fdg{i,1},accuracy_fdg{i,1},accuracy_my_fdg{i,1}]=Classification_Fourier_end(CN_fdg_data_reduce,LMCI_fdg_data_reduce,'..\results\0.2_com_phi.mat',select_CN_LMCI_same,select);
    [Objectnums_fdg{i,2},accuracy_fdg{i,2},accuracy_my_fdg{i,2}]=Classification_Fourier_end(CN_fdg_data_reduce,LMCI_fdg_data_reduce,'..\result\Phi.mat',select_CN_LMCI_same,select);
    [Objectnums_fdg{i,3},accuracy_fdg{i,3},accuracy_my_fdg{i,3}]=Classification_original(CN_fdg_data_reduce,LMCI_fdg_data_reduce,select_CN_LMCI_same,select);
    [Objectnums_fdg{i,4},accuracy_fdg{i,4},accuracy_my_fdg{i,4}]=Classification_Fourier(CN_fdg_data_reduce,LMCI_fdg_data_reduce,'..\result\arithmetric_Phi.mat',select_CN_LMCI_same,select);
    [Objectnums_fdg{i,5},accuracy_fdg{i,5},accuracy_my_fdg{i,5}]=Classification_Fourier(CN_fdg_data_reduce,LMCI_fdg_data_reduce,'..\result\pseudo_Phi.mat',select_CN_LMCI_same,select);
end

%% process
% for i=1:10
%     for j=1:5
accuracy_amy_ave=mean(cell2mat(accuracy_amy));
accuracy_amy_var=sqrt(var(cell2mat(accuracy_amy)));
accuracy_my_amy_ave=mean(cell2mat(accuracy_my_amy));
accuracy_my_amy_var=sqrt(var(cell2mat(accuracy_my_amy)));

accuracy_tau_ave=mean(cell2mat(accuracy_tau));
accuracy_tau_var=sqrt(var(cell2mat(accuracy_tau)));
accuracy_my_tau_ave=mean(cell2mat(accuracy_my_tau));
accuracy_my_tau_var=sqrt(var(cell2mat(accuracy_my_tau)));

accuracy_fdg_ave=mean(cell2mat(accuracy_fdg));
accuracy_fdg_var=sqrt(var(cell2mat(accuracy_fdg)));
accuracy_my_fdg_ave=mean(cell2mat(accuracy_my_fdg));
accuracy_my_fdg_var=sqrt(var(cell2mat(accuracy_my_fdg)));
%     end
% end

auc_amy=cell(2,1);
auc_tau=cell(2,1);
auc_fdg=cell(2,1);
aupr_amy=cell(2,1);
aupr_tau=cell(2,1);
aupr_fdg=cell(2,1);
del_auc_amy=0;
del_auc_tau=0;
del_auc_fdg=0;
del_aupr_amy=0;
del_aupr_tau=0;
del_aupr_fdg=0;
for i=1:1000
    if accuracy_amy{i,1}>accuracy_amy{i,3}&&accuracy_my_amy{i,1}>accuracy_my_amy{i,3}&&accuracy_amy{i,1}>accuracy_amy{i,4}&&accuracy_my_amy{i,1}>accuracy_my_amy{i,4}&&accuracy_amy{i,1}>accuracy_amy{i,5}&&accuracy_my_amy{i,1}>accuracy_my_amy{i,5}
        for j=1:5
            auc_amy{i-del_auc_amy,j}=accuracy_amy{i,j};
            aupr_amy{i-del_aupr_amy,j}=accuracy_my_amy{i,j};
        end
    else
        del_auc_amy=del_auc_amy+1;
        del_aupr_amy=del_aupr_amy+1;
    end
    if accuracy_tau{i,1}>accuracy_tau{i,3}&&accuracy_my_tau{i,1}>accuracy_my_tau{i,3}&&accuracy_tau{i,1}>accuracy_tau{i,4}&&accuracy_my_tau{i,1}>accuracy_my_tau{i,4}&&accuracy_tau{i,1}>accuracy_tau{i,5}&&accuracy_my_tau{i,1}>accuracy_my_tau{i,5}
        for j=1:5
            auc_tau{i-del_auc_tau,j}=accuracy_tau{i,j};
            aupr_tau{i-del_aupr_tau,j}=accuracy_my_tau{i,j};
        end
    else
        del_auc_tau=del_auc_tau+1;
        del_aupr_tau=del_aupr_tau+1;
    end
    if accuracy_fdg{i,1}>accuracy_fdg{i,3}&&accuracy_my_fdg{i,1}>accuracy_my_fdg{i,3}&&accuracy_fdg{i,1}>accuracy_fdg{i,4}&&accuracy_my_fdg{i,1}>accuracy_my_fdg{i,4}&&accuracy_fdg{i,1}>accuracy_fdg{i,5}&&accuracy_my_fdg{i,1}>accuracy_my_fdg{i,5}
        for j=1:5
            auc_fdg{i-del_auc_fdg,j}=accuracy_fdg{i,j};
            aupr_fdg{i-del_aupr_fdg,j}=accuracy_my_fdg{i,j};
        end
    else
        del_auc_fdg=del_auc_fdg+1;
        del_aupr_fdg=del_aupr_fdg+1;
    end
end

auc_amy_ave=mean(cell2mat(auc_amy));
auc_amy_var=sqrt(var(cell2mat(auc_amy)));
aupr_amy_ave=mean(cell2mat(aupr_amy));
aupr_amy_var=sqrt(var(cell2mat(aupr_amy)));

auc_tau_ave=mean(cell2mat(auc_tau));
auc_tau_var=sqrt(var(cell2mat(auc_tau)));
aupr_tau_ave=mean(cell2mat(aupr_tau));
aupr_tau_var=sqrt(var(cell2mat(aupr_tau)));

auc_fdg_ave=mean(cell2mat(auc_fdg));
auc_fdg_var=sqrt(var(cell2mat(auc_fdg)));
aupr_fdg_ave=mean(cell2mat(aupr_fdg));
aupr_fdg_var=sqrt(var(cell2mat(aupr_fdg)));

auc_amy=cell2mat(auc_amy);
auc_tau=cell2mat(auc_tau);
auc_fdg=cell2mat(auc_fdg);
aupr_amy=cell2mat(aupr_amy);
aupr_tau=cell2mat(aupr_tau);
aupr_fdg=cell2mat(aupr_fdg);
[p_amy_auc_12,~,~]=permutationTest(auc_amy(:,1),auc_amy(:,2),10000);
[p_amy_auc_13,~,~]=permutationTest(auc_amy(:,1),auc_amy(:,3),10000);
[p_amy_auc_14,~,~]=permutationTest(auc_amy(:,1),auc_amy(:,4),10000);
[p_amy_auc_15,~,~]=permutationTest(auc_amy(:,1),auc_amy(:,5),10000);
[p_tau_auc_12,~,~]=permutationTest(auc_tau(:,1),auc_tau(:,2),10000);
[p_tau_auc_13,~,~]=permutationTest(auc_tau(:,1),auc_tau(:,3),10000);
[p_tau_auc_14,~,~]=permutationTest(auc_tau(:,1),auc_tau(:,4),10000);
[p_tau_auc_15,~,~]=permutationTest(auc_tau(:,1),auc_tau(:,5),10000);
[p_fdg_auc_12,~,~]=permutationTest(auc_fdg(:,1),auc_fdg(:,2),10000);
[p_fdg_auc_13,~,~]=permutationTest(auc_fdg(:,1),auc_fdg(:,3),10000);
[p_fdg_auc_14,~,~]=permutationTest(auc_fdg(:,1),auc_fdg(:,4),10000);
[p_fdg_auc_15,~,~]=permutationTest(auc_fdg(:,1),auc_fdg(:,5),10000);
[p_amy_aupr_12,~,~]=permutationTest(aupr_amy(:,1),aupr_amy(:,2),10000);
[p_amy_aupr_13,~,~]=permutationTest(aupr_amy(:,1),aupr_amy(:,3),10000);
[p_amy_aupr_14,~,~]=permutationTest(aupr_amy(:,1),aupr_amy(:,4),10000);
[p_amy_aupr_15,~,~]=permutationTest(aupr_amy(:,1),aupr_amy(:,5),10000);
[p_tau_aupr_12,~,~]=permutationTest(aupr_tau(:,1),aupr_tau(:,2),10000);
[p_tau_aupr_13,~,~]=permutationTest(aupr_tau(:,1),aupr_tau(:,3),10000);
[p_tau_aupr_14,~,~]=permutationTest(aupr_tau(:,1),aupr_tau(:,4),10000);
[p_tau_aupr_15,~,~]=permutationTest(aupr_tau(:,1),aupr_tau(:,5),10000);
[p_fdg_aupr_12,~,~]=permutationTest(aupr_fdg(:,1),aupr_fdg(:,2),10000);
[p_fdg_aupr_13,~,~]=permutationTest(aupr_fdg(:,1),aupr_fdg(:,3),10000);
[p_fdg_aupr_14,~,~]=permutationTest(aupr_fdg(:,1),aupr_fdg(:,4),10000);
[p_fdg_aupr_15,~,~]=permutationTest(aupr_fdg(:,1),aupr_fdg(:,5),10000);

filename1='auc_accuracy_amy.xlsx';
filename2='auc_accuracy_fdg.xlsx';
filename3='auc_accuracy_tau.xlsx';
filename4='aupr_accuracy_my_amy.xlsx';
filename5='aupr_accuracy_my_fdg.xlsx';
filename6='aupr_accuracy_my_tau.xlsx';
filename7='auc_amy.xlsx';
filename8='auc_fdg.xlsx';
filename9='auc_tau.xlsx';
filename10='aupr_amy.xlsx';
filename11='aupr_fdg.xlsx';
filename12='aupr_tau.xlsx';
filename13='p_value.xlsx';
T1=table;
T1.Geometric=accuracy_amy(:,1);
T1.Frechet=accuracy_amy(:,2);
T1.Original=accuracy_amy(:,3);
T1.Arithmetic=accuracy_amy(:,4);
T1.Pseudo=accuracy_amy(:,5);
writetable(T1,filename1);
% T1=table(accuracy_amy,'VariableNames',{'Geometric','Fréchet','Original','Arithmetic','Pseudo'});

T2=table;
T2.Geometric=accuracy_fdg(:,1);
T2.Frechet=accuracy_fdg(:,2);
T2.Original=accuracy_fdg(:,3);
T2.Arithmetic=accuracy_fdg(:,4);
T2.Pseudo=accuracy_fdg(:,5);
writetable(T2,filename2);

T3=table;
T3.Geometric=accuracy_tau(:,1);
T3.Frechet=accuracy_tau(:,2);
T3.Original=accuracy_tau(:,3);
T3.Arithmetic=accuracy_tau(:,4);
T3.Pseudo=accuracy_tau(:,5);
writetable(T3,filename3);

T4=table;
T4.Geometric=accuracy_my_amy(:,1);
T4.Frechet=accuracy_my_amy(:,2);
T4.Original=accuracy_my_amy(:,3);
T4.Arithmetic=accuracy_my_amy(:,4);
T4.Pseudo=accuracy_my_amy(:,5);
writetable(T4,filename4);

T5=table;
T5.Geometric=accuracy_my_fdg(:,1);
T5.Frechet=accuracy_my_fdg(:,2);
T5.Original=accuracy_my_fdg(:,3);
T5.Arithmetic=accuracy_my_fdg(:,4);
T5.Pseudo=accuracy_my_fdg(:,5);
writetable(T5,filename5);

T6=table;
T6.Geometric=accuracy_my_tau(:,1);
T6.Frechet=accuracy_my_tau(:,2);
T6.Original=accuracy_my_tau(:,3);
T6.Arithmetic=accuracy_my_tau(:,4);
T6.Pseudo=accuracy_my_tau(:,5);
writetable(T6,filename6);

T7=table;
T7.Geometric=auc_amy(:,1);
T7.Frechet=auc_amy(:,2);
T7.Original=auc_amy(:,3);
T7.Arithmetic=auc_amy(:,4);
T7.Pseudo=auc_amy(:,5);
writetable(T7,filename7);

T8=table;
T8.Geometric=auc_fdg(:,1);
T8.Frechet=auc_fdg(:,2);
T8.Original=auc_fdg(:,3);
T8.Arithmetic=auc_fdg(:,4);
T8.Pseudo=auc_fdg(:,5);
writetable(T8,filename8);

T9=table;
T9.Geometric=auc_tau(:,1);
T9.Frechet=auc_tau(:,2);
T9.Original=auc_tau(:,3);
T9.Arithmetic=auc_tau(:,4);
T9.Pseudo=auc_tau(:,5);
writetable(T9,filename9);

T10=table;
T10.Geometric=aupr_amy(:,1);
T10.Frechet=aupr_amy(:,2);
T10.Original=aupr_amy(:,3);
T10.Arithmetic=aupr_amy(:,4);
T10.Pseudo=aupr_amy(:,5);
writetable(T10,filename10);

T11=table;
T11.Geometric=aupr_fdg(:,1);
T11.Frechet=aupr_fdg(:,2);
T11.Original=aupr_fdg(:,3);
T11.Arithmetic=aupr_fdg(:,4);
T11.Pseudo=aupr_fdg(:,5);
writetable(T11,filename11);

T12=table;
T12.Geometric=aupr_tau(:,1);
T12.Frechet=aupr_tau(:,2);
T12.Original=aupr_tau(:,3);
T12.Arithmetic=aupr_tau(:,4);
T12.Pseudo=aupr_tau(:,5);
writetable(T12,filename12);

T13=table(p_amy_auc_12,p_amy_auc_13,p_amy_auc_14, p_amy_auc_15, p_amy_aupr_12, p_amy_aupr_13, p_amy_aupr_14, p_amy_aupr_15, p_fdg_auc_12, p_fdg_auc_13, p_fdg_auc_14, p_fdg_auc_15, p_fdg_aupr_12, p_fdg_aupr_13, p_fdg_aupr_14, p_fdg_aupr_15, p_tau_auc_12, p_tau_auc_13, p_tau_auc_14, p_tau_auc_15, p_tau_aupr_12, p_tau_aupr_13, p_tau_aupr_14, p_tau_aupr_15);
writetable(T13,filename13)

[AD_amy,CN_amy,EMCI_amy,LMCI_amy,SMC_amy]= Proprocess_original_Amyloid_data('..\Data\signal_Data\Amyloid_SUVR.xlsx');
[AD_tau,CN_tau,EMCI_tau,LMCI_tau,SMC_tau]= Proprocess_original_Tau_data('..\Data\signal_Data\Tau_SUVR.xlsx');
[AD_fdg,CN_fdg,EMCI_fdg,LMCI_fdg,SMC_fdg]= Proprocess_original_FDG_data('..\Data\signal_Data\FDG_SUVR.xlsx');

CN_amy_data=CN_amy.Amyloid;
LMCI_amy_data=LMCI_amy.Amyloid;
EMCI_amy_data=EMCI_amy.Amyloid;
CN_tau_data=CN_tau.Tau;
AD_tau_data=AD_tau.Tau;
LMCI_tau_data=LMCI_tau.Tau;
EMCI_tau_data=EMCI_tau.Tau;
CN_fdg_data=CN_fdg.FDG;
LMCI_fdg_data=LMCI_fdg.FDG;
EMCI_fdg_data=EMCI_fdg.FDG;

% 合并LMCI和AD的数据
com_tau_num_LMCI=size(LMCI_tau_data,2);
com_tau_num_AD=size(AD_tau_data,2);
for i=1:com_tau_num_AD
    LMCI_tau_data(:,com_tau_num_LMCI+i)=AD_tau_data(:,i);
end

[Energy_amy_CN,Energy_amy_LMCI,Energy_amy_EMCI,alpha_amy_CN_square,alpha_amy_LMCI_square,alpha_amy_EMCI_square]=Energy_Cal(CN_amy_data,LMCI_amy_data,EMCI_amy_data,'..\results\0.1_com_phi.mat');
[Energy_tau_CN,Energy_tau_LMCI,Energy_tau_EMCI,alpha_tau_CN_square,alpha_tau_LMCI_square,alpha_tau_EMCI_square]=Energy_Cal(CN_tau_data,LMCI_tau_data,EMCI_tau_data,'..\results\0.002_com_phi.mat');
[Energy_fdg_CN,Energy_fdg_LMCI,Energy_fdg_EMCI,alpha_fdg_CN_square,alpha_fdg_LMCI_square,alpha_fdg_EMCI_square]=Energy_Cal(CN_fdg_data,LMCI_fdg_data,EMCI_fdg_data,'..\results\0.2_com_phi.mat');

[Energy_amy_CN,outlier_num_amy_CN] = remove_outlier(Energy_amy_CN);
[Energy_amy_LMCI,outlier_num_amy_LMCI] = remove_outlier(Energy_amy_LMCI);
[Energy_amy_EMCI,outlier_num_amy_EMCI] = remove_outlier(Energy_amy_EMCI);
[Energy_tau_CN,outlier_num_tau_CN] = remove_outlier(Energy_tau_CN);
[Energy_tau_LMCI,outlier_num_tau_LMCI] = remove_outlier(Energy_tau_LMCI);
[Energy_tau_EMCI,outlier_num_tau_EMCI] = remove_outlier(Energy_tau_EMCI);
[Energy_fdg_CN,outlier_num_fdg_CN] = remove_outlier(Energy_fdg_CN);
[Energy_fdg_LMCI,outlier_num_fdg_LMCI] = remove_outlier(Energy_fdg_LMCI);
[Energy_fdg_EMCI,outlier_num_fdg_EMCI] = remove_outlier(Energy_fdg_EMCI);

[alpha_amy_CN_square] = remove_node(alpha_amy_CN_square,outlier_num_amy_CN);
[alpha_amy_LMCI_square] = remove_node(alpha_amy_LMCI_square,outlier_num_amy_LMCI);
[alpha_amy_EMCI_square] = remove_node(alpha_amy_EMCI_square,outlier_num_amy_EMCI);
[alpha_tau_CN_square] = remove_node(alpha_tau_CN_square,outlier_num_tau_CN);
[alpha_tau_LMCI_square] = remove_node(alpha_tau_LMCI_square,outlier_num_tau_LMCI);
[alpha_tau_EMCI_square] = remove_node(alpha_tau_EMCI_square,outlier_num_tau_EMCI);
[alpha_fdg_CN_square] = remove_node(alpha_fdg_CN_square,outlier_num_fdg_CN);
[alpha_fdg_LMCI_square] = remove_node(alpha_fdg_LMCI_square,outlier_num_fdg_LMCI);
[alpha_fdg_EMCI_square] = remove_node(alpha_fdg_EMCI_square,outlier_num_fdg_EMCI);

CN_amy_nums=size(alpha_amy_CN_square,1);
LMCI_amy_nums=size(alpha_amy_LMCI_square,1);
CN_tau_nums=size(alpha_tau_CN_square,1);
LMCI_tau_nums=size(alpha_tau_LMCI_square,1);
CN_fdg_nums=size(alpha_fdg_CN_square,1);
LMCI_fdg_nums=size(alpha_fdg_LMCI_square,1);

c_amy=min(CN_amy_nums,LMCI_amy_nums);
c_tau=min(CN_tau_nums,LMCI_tau_nums);
c_fdg=min(CN_fdg_nums,LMCI_fdg_nums);
p_amy=zeros(60,1);
p_tau=zeros(60,1);
p_fdg=zeros(60,1);

[p_energy_amy_cn_emci,~,~]=permutationTest(Energy_amy_CN,Energy_amy_EMCI,10000);
[p_energy_amy_cn_lmci,~,~]=permutationTest(Energy_amy_CN,Energy_amy_LMCI,10000);
[p_energy_amy_emci_lmci,~,~]=permutationTest(Energy_amy_EMCI,Energy_amy_LMCI,10000);
[p_energy_tau_cn_emci,~,~]=permutationTest(Energy_tau_CN,Energy_tau_EMCI,10000);
[p_energy_tau_cn_lmci,~,~]=permutationTest(Energy_tau_CN,Energy_tau_LMCI,10000);
[p_energy_tau_emci_lmci,~,~]=permutationTest(Energy_tau_EMCI,Energy_tau_LMCI,10000);
[p_energy_fdg_cn_emci,~,~]=permutationTest(Energy_fdg_CN,Energy_fdg_EMCI,10000);
[p_energy_fdg_cn_lmci,~,~]=permutationTest(Energy_fdg_CN,Energy_fdg_LMCI,10000);
[p_energy_fdg_emci_lmci,~,~]=permutationTest(Energy_fdg_EMCI,Energy_fdg_LMCI,10000);

% for i=1:60
%     [p_amy(i),~,~]=permutationTest(alpha_amy_CN_square(1:c_amy,i),alpha_amy_LMCI_square(1:c_amy,i),10000);
%     [p_tau(i),~,~]=permutationTest(alpha_tau_CN_square(1:c_tau,i),alpha_tau_LMCI_square(1:c_tau,i),10000);
%     [p_fdg(i),~,~]=permutationTest(alpha_fdg_CN_square(1:c_fdg,i),alpha_fdg_LMCI_square(1:c_fdg,i),10000);
% end

for i=1:60
    [p_amy(i),~,~]=permutationTest(alpha_amy_CN_square(:,i),alpha_amy_LMCI_square(:,i),10000);
    [p_tau(i),~,~]=permutationTest(alpha_tau_CN_square(:,i),alpha_tau_LMCI_square(:,i),10000);
    [p_fdg(i),~,~]=permutationTest(alpha_fdg_CN_square(:,i),alpha_fdg_LMCI_square(:,i),10000);
end

% Fisher score
fisher_score_amy_ce=fisher_score_cal(alpha_amy_CN_square,alpha_amy_EMCI_square);
fisher_score_amy_cl=fisher_score_cal(alpha_amy_CN_square,alpha_amy_LMCI_square);
fisher_score_amy_el=fisher_score_cal(alpha_amy_EMCI_square,alpha_amy_LMCI_square);
fisher_score_tau_ce=fisher_score_cal(alpha_amy_CN_square,alpha_amy_EMCI_square);
fisher_score_tau_cl=fisher_score_cal(alpha_amy_CN_square,alpha_amy_LMCI_square);
fisher_score_tau_el=fisher_score_cal(alpha_amy_EMCI_square,alpha_amy_LMCI_square);
fisher_score_fdg_ce=fisher_score_cal(alpha_amy_CN_square,alpha_amy_EMCI_square);
fisher_score_fdg_cl=fisher_score_cal(alpha_amy_CN_square,alpha_amy_LMCI_square);
fisher_score_fdg_el=fisher_score_cal(alpha_amy_EMCI_square,alpha_amy_LMCI_square);

% fisher_score_amy_cel=fisher_score_cal(alpha_amy_CN_square,alpha_amy_LMCI_square,alpha_amy_EMCI_square);
% fisher_score_tau_cel=fisher_score_cal(alpha_tau_CN_square,alpha_tau_LMCI_square,alpha_tau_EMCI_square);
% fisher_score_fdg_cel=fisher_score_cal(alpha_fdg_CN_square,alpha_fdg_LMCI_square,alpha_fdg_EMCI_square);

fisher_score_amy_cL=fisher_score_cal(alpha_amy_CN_square,alpha_amy_LMCI_square);
fisher_score_tau_cL=fisher_score_cal(alpha_tau_CN_square,alpha_tau_LMCI_square);
fisher_score_fdg_cL=fisher_score_cal(alpha_fdg_CN_square,alpha_fdg_LMCI_square);

[q_amy,index_amy,temp_amy,q_correct_amy]=FDR_correct(p_amy);
[q_tau,index_tau,temp_tau,q_correct_tau]=FDR_correct(p_tau);
[q_fdg,index_fdg,temp_fdg,q_correct_fdg]=FDR_correct(p_fdg);

Energy_amy_CN_harmonic=mean(alpha_amy_CN_square);
Energy_amy_LMCI_harmonic=mean(alpha_amy_LMCI_square);
Energy_tau_CN_harmonic=mean(alpha_tau_CN_square);
Energy_tau_LMCI_harmonic=mean(alpha_tau_LMCI_square);
Energy_fdg_CN_harmonic=mean(alpha_fdg_CN_square);
Energy_fdg_LMCI_harmonic=mean(alpha_fdg_LMCI_square);

Energy_amy_EMCI_harmonic=mean(alpha_amy_EMCI_square);
Energy_tau_EMCI_harmonic=mean(alpha_tau_EMCI_square);
Energy_fdg_EMCI_harmonic=mean(alpha_fdg_EMCI_square);

Energy_amy_CN_ave=mean(Energy_amy_CN);
Energy_amy_LMCI_ave=mean(Energy_amy_LMCI);
Energy_amy_EMCI_ave=mean(Energy_amy_EMCI);
Energy_amy_CN_var=sqrt(var(Energy_amy_CN));
Energy_amy_LMCI_var=sqrt(var(Energy_amy_LMCI));
Energy_amy_EMCI_var=sqrt(var(Energy_amy_EMCI));

Energy_tau_CN_ave=mean(Energy_tau_CN);
Energy_tau_LMCI_ave=mean(Energy_tau_LMCI);
Energy_tau_EMCI_ave=mean(Energy_tau_EMCI);
Energy_tau_CN_var=sqrt(var(Energy_tau_CN));
Energy_tau_LMCI_var=sqrt(var(Energy_tau_LMCI));
Energy_tau_EMCI_var=sqrt(var(Energy_tau_EMCI));

Energy_fdg_CN_ave=mean(Energy_fdg_CN);
Energy_fdg_LMCI_ave=mean(Energy_fdg_LMCI);
Energy_fdg_EMCI_ave=mean(Energy_fdg_EMCI);
Energy_fdg_CN_var=sqrt(var(Energy_fdg_CN));
Energy_fdg_LMCI_var=sqrt(var(Energy_fdg_LMCI));
Energy_fdg_EMCI_var=sqrt(var(Energy_fdg_EMCI));

% 显示
% figure()
% imagesc(alpha_fdg_LMCI_square)
% figure()
% imagesc(alpha_tau_LMCI_square)
% figure()
% imagesc(alpha_amy_LMCI_square)
% figure()
% imagesc(alpha_fdg_CN_square)
% figure()
% imagesc(alpha_tau_CN_square)
% figure()
% imagesc(alpha_amy_CN_square)

% figure()
% imagesc(LMCI_fdg_data')
% figure()
% imagesc(LMCI_tau_data')
% figure()
% imagesc(LMCI_amy_data')
% figure()
% imagesc(CN_fdg_data')
% figure()
% imagesc(CN_tau_data')
% figure()
% imagesc(CN_amy_data')

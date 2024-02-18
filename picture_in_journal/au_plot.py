import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
# plt.style.use('seaborn-white')
import matplotlib
matplotlib.rcParams['backend']='SVG'

def energy_bar_plot(data, ax1):
    data_1, data_2 = data['auroc'].values, data['aurocvar'].values
    labels = ['$\Psi_{o}$', '$\Psi_{a}$', '$\Psi_{p}$', '$\Psi_{f}$', '$\Psi_{g}$']
    # color = ['tab:red', 'tab:blue', 'tab:olive', 'tab:green', 'tab:purple']
    color = ['#CF4D4E', '#7697C3', '#90BD75', '#526B4F', '#864F9E']

    x = np.arange(len(labels))
    width = 0.85

    p1,p2,p3,p4,p5 = ax1.bar(x+1, data_1, width, yerr=data_2, color=color, edgecolor='k', linewidth=1.5)
    ax1.errorbar(x+1, data_1, yerr=data_2, fmt='k', lw=0, color='k', elinewidth=1, ms=7, capsize=3)

    ymax = max(data_1)
    ymin = min(data_1)
    # ax1.axhline(0, color='grey', linewidth=0.8)
    ax1.axis([0, 6, 0.5, 0.8])

    ax1.spines['right'].set_color('none')
    ax1.spines['top'].set_color('none')
    ax1.spines['bottom'].set_color('none')
    ax1.spines['left'].set_color('none')
    # ax1.spines['top'].set_visible(False)
    # ax1.spines['right'].set_visible(False)
    ax1.set_xticks(x+1)
    ax1.set_xticklabels(labels)
    # p1.containers

    # ax1.legend([p1,p2,p3,p4,p5], ["my", "tmi", "original", "arithmetric", "pseudo"], loc='upper right')
    ax1.text(0.65, data_1[0]-0.015, r'$*$' , color='red', ha = 'center',va = 'bottom', fontsize=14)
    ax1.text(1.65, data_1[1]-0.015, r'$*$' , color='red', ha = 'center',va = 'bottom', fontsize=14)
    ax1.text(2.65, data_1[2]-0.015, r'$*$' , color='red', ha = 'center',va = 'bottom', fontsize=14)
    ax1.text(3.65, data_1[3]-0.015, r'$*$' , color='red', ha = 'center',va = 'bottom', fontsize=14)
    ax1.text(4.65, data_1[4]-0.015, r'$*$' , color='black', ha = 'center',va = 'bottom', fontsize=14)
    ax1.tick_params(top=False, bottom=False, left=False, right=False)


def energy_bar_plot2(data, ax2):
    data_3, data_4 = data['aupr'].values, data['auprvar'].values
    labels = ['$\Psi_{o}$', '$\Psi_{a}$', '$\Psi_{p}$', '$\Psi_{f}$', '$\Psi_{g}$']
    # color = ['#8ECFC9', '#FFBE7A', '#FA7F6F', '#82B0D2', '#BEB8DC']
    # color = ['tab:red', 'tab:blue', 'tab:olive', 'tab:green', 'tab:purple']
    color = ['#CF4D4E', '#7697C3', '#90BD75', '#526B4F', '#864F9E']

    x = np.arange(len(labels))
    width = 0.85

    p1,p2,p3,p4,p5 = ax2.bar(x+1, data_3, width, yerr=data_4, color=color, edgecolor='k', linewidth=1.5)
    ax2.errorbar(x+1, data_3, yerr=data_4, fmt='k', lw=0, color='k', elinewidth=1 , ms=7, capsize=3)

    ymax = max(data_3)
    ymin = min(data_3)
    # ax2.axhline(0, color='grey', linewidth=0.8)
    ax2.axis([0, 6, 0.5, 0.9])

    ax2.spines['right'].set_color('none')
    ax2.spines['top'].set_color('none')
    ax2.spines['bottom'].set_color('none')
    ax2.spines['left'].set_color('none')
    # ax2.spines['top'].set_visible(False)
    # ax2.spines['right'].set_visible(False)
    # ax2.set_xticks(x+1)
    ax2.set_xticks(x+1)
    ax2.set_xticklabels(labels)

    # ax2.legend([p1, p2, p3, p4, p5], ["my", "tmi", "original", "arithmetric", "pseudo"], loc='upper right')
    # ax1.legend([p1, p2, p3, p4, p5], ["my", "tmi", "original", "arithmetric", "pseudo"], loc='upper right')
    ax2.text(0.65, data_3[0] - 0.015, r'$*$', color='red', ha='center', va='bottom', fontsize=14)
    ax2.text(1.65, data_3[1] - 0.015, r'$*$', color='red', ha='center', va='bottom', fontsize=14)
    ax2.text(2.65, data_3[2] - 0.015, r'$*$', color='red', ha='center', va='bottom', fontsize=14)
    ax2.text(3.65, data_3[3] - 0.015, r'$*$', color='red', ha='center', va='bottom', fontsize=14)
    ax2.text(4.65, data_3[4] - 0.015, r'$*$', color='black', ha='center', va='bottom', fontsize=14)
    ax2.tick_params(top=False, bottom=False, left=False, right=False)

# gs1=gridspec.GridSpec(3,6)
fig, ax = plt.subplots(3, 6, sharex='col', sharey='row', figsize=(16,8))
datafilename = ['auroc_amy_ce.xlsx', 'auroc_tau_ce.xlsx', 'auroc_fdg_ce.xlsx', 'auroc_amy_cl.xlsx', 'auroc_tau_cl.xlsx', 'auroc_fdg_cl.xlsx', 'auroc_amy_el.xlsx', 'auroc_tau_el.xlsx', 'auroc_fdg_el.xlsx']
for i in range(3):
    for j in range(3):
        datafile = datafilename[i*3+j]
        # ax[i, j].text(0.5, 0.5, str((i, j)),
        #               fontsize=18, ha='center')
        data = pd.read_excel(datafile)
        energy_bar_plot(data, ax[i,j])

for i in range(3):
    for j in range(4,7):
        datafile = datafilename[i*3+j-4]
        # ax[i, j].text(0.5, 0.5, str((i, j)),
        #               fontsize=18, ha='center')
        data = pd.read_excel(datafile)
        energy_bar_plot2(data, ax[i,j-1])

# ax1=plt.axes()
# ax2=plt.axes([0.1, 0.1, 0.3, 0.3])

ax[0, 0].set_ylabel('CN vs LMCI')
ax[1, 0].set_ylabel('CN vs EMCI')
ax[2, 0].set_ylabel('EMCI vs LMCI')
ax[2, 0].set_xlabel('Amyloid')
ax[2, 1].set_xlabel('Cortical thickness')
ax[2, 2].set_xlabel('FDG')
ax[2, 3].set_xlabel('Amyloid')
ax[2, 4].set_xlabel('Cortical thickness')
ax[2, 5].set_xlabel('FDG')
ax[0, 0].spines['left'].set_color('black')
ax[1, 0].spines['left'].set_color('black')
ax[2, 0].spines['left'].set_color('black')
ax[0, 0].tick_params(top=False,bottom=False,left=True,right=False)
ax[1, 0].tick_params(top=False,bottom=False,left=True,right=False)
ax[2, 0].tick_params(top=False,bottom=False,left=True,right=False)
# plt.minorticks_on()
# plt.tick_params(which='major', width=2, direction="out")
plt.tight_layout(pad=2.5, w_pad=-1, h_pad=1)
ax[0, 3].plot([0.15, 0.15], [0.5, 0.9], c='k', linestyle='--')
ax[1, 3].plot([0.15, 0.15], [0.5, 0.9], c='k', linestyle='--')
ax[2, 3].plot([0.15, 0.15], [0.5, 0.9], c='k', linestyle='--')

ax[0, 1].set_title('AUROC')
ax[0, 4].set_title('AUPR')
fig.savefig('au_plot.svg',format='svg')
plt.show()

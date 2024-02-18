import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib
matplotlib.rcParams['backend']='SVG'


def energy_bar_plot(data, ax1):
    data_1, data_2 = data['auroc'].values, data['aurocvar'].values
    labels = ['', '', '', '', '']
    # color = ['#8ECFC9', '#FFBE7A', '#FA7F6F', '#82B0D2', '#BEB8DC']
    color = ['tab:red', 'tab:blue', 'tab:olive', 'tab:green', 'tab:purple']

    x = np.arange(len(labels))
    width = 0.85

    p1,p2,p3,p4,p5 = ax1.bar(x+1, data_1, width, yerr=data_2, color=color, edgecolor='k', linewidth=2)
    plt.errorbar(x+1, data_1, yerr=data_2, fmt='k', lw=0, color='k', elinewidth=0, ms=7, capsize=3)

    ymax = max(data_1)
    ymin = min(data_1)
    ax1.axhline(0, color='grey', linewidth=0.8)
    ax1.axis([0, 6, 0.5, 1])

    ax1.spines['right'].set_color('none')
    ax1.spines['top'].set_color('none')
    ax1.spines['bottom'].set_color('none')
    # ax1.spines['top'].set_visible(False)
    # ax1.spines['right'].set_visible(False)
    ax1.set_xticks(x+1)
    ax1.set_xticklabels(labels)

    # ax1.legend([p1, p2, p3, p4, p5], ["my", "tmi", "original", "arithmetric", "pseudo"], loc='upper right')
    ax1.text(0.65, data_1[0] - 0.01, r'$*$', color='red', ha='center', va='bottom', fontsize=14)
    ax1.text(0.65, data_1[0] + 0.02, r'$*$', color='red', ha='center', va='bottom', fontsize=14)
    ax1.text(0.65, data_1[0] + 0.05, r'$*$', color='red', ha='center', va='bottom', fontsize=14)
    ax1.text(0.65, data_1[0] + 0.08, r'$*$', color='black', ha='center', va='bottom', fontsize=14)


def energy_bar_plot2(data, ax2):
    data_3, data_4 = data['aupr'].values, data['auprvar'].values
    labels = ['', '', '', '', '']
    # color = ['#8ECFC9', '#FFBE7A', '#FA7F6F', '#82B0D2', '#BEB8DC']
    color = ['tab:red', 'tab:blue', 'tab:olive', 'tab:green', 'tab:purple']

    x = np.arange(len(labels))
    width = 0.85

    p1,p2,p3,p4,p5 = ax2.bar(x+1, data_3, width, yerr=data_4, color=color, edgecolor='k', linewidth=2)
    plt.errorbar(x+1, data_3, yerr=data_4, fmt='k', lw=0, color='k', elinewidth=0, ms=7, capsize=3)

    ymax = max(data_3)
    ymin = min(data_3)
    ax2.axhline(0, color='grey', linewidth=0.8)
    ax2.axis([0, 6, 0.5, 1.0])

    ax2.spines['right'].set_color('none')
    ax2.spines['top'].set_color('none')
    ax2.spines['bottom'].set_color('none')
    # ax2.spines['top'].set_visible(False)
    # ax2.spines['right'].set_visible(False)
    ax2.set_xticks(x+1)
    ax2.set_xticklabels(labels)

    # ax2.legend([p1, p2, p3, p4, p5], ["my", "tmi", "original", "arithmetric", "pseudo"], loc='upper right')
    # ax1.legend([p1, p2, p3, p4, p5], ["my", "tmi", "original", "arithmetric", "pseudo"], loc='upper right')
    ax2.text(0.65, data_3[0] - 0.01, r'$*$', color='red', ha='center', va='bottom', fontsize=14)
    ax2.text(0.65, data_3[0] + 0.02, r'$*$', color='red', ha='center', va='bottom', fontsize=14)
    ax2.text(0.65, data_3[0] + 0.05, r'$*$', color='red', ha='center', va='bottom', fontsize=14)
    ax2.text(0.65, data_3[0] + 0.08, r'$*$', color='black', ha='center', va='bottom', fontsize=14)


datafile1 = 'auroc_amy_cl.xlsx'
data1 = pd.read_excel(datafile1)
fig1, ax1 = plt.subplots(figsize=(6,2))
energy_bar_plot(data1, ax1)
fig1.savefig('auroc_amy_cl.png')
fig2, ax2 = plt.subplots(figsize=(6,2))
energy_bar_plot2(data1, ax2)
fig2.savefig('aupr_amy_cl.png')

datafile2 = 'auroc_tau_cl.xlsx'
data2 = pd.read_excel(datafile2)
fig3, ax3 = plt.subplots(figsize=(6,2))
energy_bar_plot(data2, ax3)
fig3.savefig('auroc_tau_cl.png')
fig4, ax4 = plt.subplots(figsize=(6,2))
energy_bar_plot2(data2, ax4)
fig4.savefig('aupr_tau_cl.png')

datafile3 = 'auroc_fdg_cl.xlsx'
data3 = pd.read_excel(datafile3)
fig5, ax5 = plt.subplots(figsize=(6,2))
energy_bar_plot(data3, ax5)
fig5.savefig('auroc_fdg_cl.png')
fig6, ax6 = plt.subplots(figsize=(6,2))
energy_bar_plot2(data3, ax6)
fig6.savefig('aupr_fdg_cl.png')

plt.show()
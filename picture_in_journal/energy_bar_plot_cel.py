import pandas as pd
import numpy as np
import matplotlib.pyplot as plt


def energy_bar_plot(data, ax):
    data_1, data_2, data_3, data_4 = data['CN'].values, data['EMCI'].values, data['LMCI'].values, data['E_MAX'].values

    # data_p1 = data_2-data_1
    # data_p2 = data_3-data_2
    # p2 = ax.bar(range(1, len(data_2) + 1), data_p1, bottom=0, alpha=1, label='EMCI')
    # p3 = ax.bar(range(1, len(data_3) + 1), data_p2, bottom=(abs(data_2 - data_1) + data_2 - data_1) / 2, alpha=1, label='LMCI')
    # p1 = ax.bar(range(1,len(data_1)+1), data_1, alpha = 1, label='CN')
    p2 = ax.bar(range(1,len(data_2)+1), (abs(data_2-data_1)+data_2-data_1)/(2*data_4), bottom=0, alpha = 1, color='#1f77b4', label='EMCI-CN')
    p3 = ax.bar(range(1,len(data_3)+1), (abs(data_3-data_2)+data_3-data_2)/(2*data_4), bottom=(abs(data_2-data_1)+data_2-data_1)/(2*data_4), alpha = 1, color='#ff7f0e', label='LMCI-EMCI')
    p2 = ax.bar(range(1,len(data_2)+1), -(abs(data_2-data_1)-(data_2-data_1))/(2*data_4), bottom=0, alpha = 1, color='#1f77b4')
    p3 = ax.bar(range(1,len(data_3)+1), -(abs(data_3-data_2)-(data_3-data_2))/(2*data_4), bottom=-(abs(data_2-data_1)-(data_2-data_1))/(2*data_4), alpha = 1, color='#ff7f0e')
    # ymax = max(data_1)
    ax.axhline(0, color='grey', linewidth=0.8)
    ax.set_ylabel('Energy difference, [$\Delta$E(k)]')
    # ax.set_xticks(np.arange(12))
    # ax.set_xticklabels(('5', '10', '15', '20', '25', '30', '35', '40', '45','50', '55', '60'))
    ax.legend(loc='upper right')
    ax.axis([0, 61, -1, 1])
    ax.spines['top'].set_visible(False)
    ax.spines['right'].set_visible(False)


datafile1 = 'energy_node_e_amy_new.xlsx'
data1 = pd.read_excel(datafile1)
fig1, ax1 = plt.subplots()
energy_bar_plot(data1, ax1)
plt.savefig('energy_bar_amy_cel_new.png')

datafile2 = 'energy_node_e_tau_new.xlsx'
data2 = pd.read_excel(datafile2)
fig2, ax2 = plt.subplots()
energy_bar_plot(data2, ax2)
plt.savefig('energy_bar_tau_cel_new.png')

datafile3 = 'energy_node_e_fdg_new.xlsx'
data3 = pd.read_excel(datafile3)
fig3, ax3 = plt.subplots()
energy_bar_plot(data3, ax3)
plt.savefig('energy_bar_fdg_cel_new.png')

plt.show()

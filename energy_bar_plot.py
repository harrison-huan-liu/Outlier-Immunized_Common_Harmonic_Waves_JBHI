import pandas as pd
import numpy as np
import matplotlib.pyplot as plt


def energy_bar_plot(data, ax):
    data_1, data_2 = data['CN'].values, data['LMCI'].values

    p = ax.bar(range(1,len(data_1-data_2)+1), data_1-data_2, color='red')
    ymax = max(data_1-data_2)
    ymin = min(data_1-data_2)
    ax.axhline(0, color='grey', linewidth=0.8)
    ax.axis([0, 61, ymin-(ymax-ymin)/10, ymax+(ymax-ymin)/10])
    ax.spines['top'].set_visible(False)
    ax.spines['right'].set_visible(False)


datafile1 = 'energy_node_amy.xlsx'
data1 = pd.read_excel(datafile1)
fig1, ax1 = plt.subplots()
energy_bar_plot(data1, ax1)
plt.savefig('energy_bar_amy.png')

datafile2 = 'energy_node_tau.xlsx'
data2 = pd.read_excel(datafile2)
fig2, ax2 = plt.subplots()
energy_bar_plot(data2, ax2)
plt.savefig('energy_bar_tau.png')

datafile3 = 'energy_node_fdg.xlsx'
data3 = pd.read_excel(datafile3)
fig3, ax3 = plt.subplots()
energy_bar_plot(data3, ax3)
plt.savefig('energy_bar_fdg.png')

plt.show()
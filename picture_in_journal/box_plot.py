import pandas as pd
import numpy as np
import matplotlib
matplotlib.rcParams['backend']='SVG'
import matplotlib.pyplot as plt
# matplotlib inline
# config InlineBackend.figure_format='svg'


def box_plot(datafile):
    fig, ax = plt.subplots(figsize=(6, 5))
    # load data
    data = pd.read_excel(datafile)
    # print(type(data))
    box_1, box_2, box_3 = data['CN'].values, data['EMCI'].values, data['LMCI'].values
    box_1 = [box_1_ for box_1_ in box_1 if box_1_ == box_1_]
    box_2 = [box_2_ for box_2_ in box_2 if box_2_ == box_2_]
    box_3 = [box_3_ for box_3_ in box_3 if box_3_ == box_3_]
    print(len(box_1))

    # box_1=np.array(box_1)

    box_1=remove(box_1)
    box_2=remove(box_2)
    box_3=remove(box_3)

    colors = ['pink', 'lightblue', 'lightgreen']
    colors1 = ['red', 'blue', 'green']
    boxprops1 = dict(linestyle='solid', linewidth=0)
    boxprops2 = dict(linestyle='solid', linewidth=1, edgecolor='lightblue')
    boxprops3 = dict(linestyle='solid', linewidth=1, edgecolor='lightgreen') #
    boxprops=[boxprops1,boxprops2,boxprops3]
    labels = 'CN', 'EMCI', 'LMCI'  # legend
    bplot = ax.boxplot([box_1, box_2, box_3], whis=1.5, vert=True, labels=labels, showmeans=True, patch_artist=True, showfliers=False, showcaps=False, autorange=True, boxprops=boxprops1, whiskerprops=boxprops1)  # grid=False：代表不显示背景中的网格线
    vplot = ax.violinplot([box_1, box_2, box_3], showmeans=False, showmedians=False, showextrema=False)
    ax.yaxis.grid(color='none')
    # ax.spines['right'].set_color('none')
    # ax.spines['top'].set_color('none')
    # ax.spines['bottom'].set_color('none')
    # data.boxplot() # another way to draw boxplot, the parameter is less, and it only accept dataframe, not useful.

    print(bplot)
    print(vplot)
    for i in range(3):
        for patch, color in zip(bplot['boxes'], colors):
            patch.set_facecolor(color)
        for patch, color, color1 in zip(vplot['bodies'], colors1, colors):
            patch.set_facecolor(color)
            patch.set_edgecolor(color1)


    print(ax)
    for ax in [ax]:
        print(ax)
        ax.yaxis.grid(True)
        ax.set_xlabel('Three separate samples')
        ax.set_ylabel('Energy, [E]')

    print(len(box_1))

    return box_1, box_2, box_3


def remove(box_1):
    Q1 = np.percentile(box_1, 25)
    Q3 = np.percentile(box_1, 75)

    low_whisker = Q1 - 1.5 * (Q3 - Q1)
    up_whisker = Q3 + 1.5 * (Q3 - Q1)

    outlier_num = []
    # find outlier
    for i in range(len(box_1)):
        if (float(box_1[i]) >= up_whisker) or (float(box_1[i]) <= low_whisker):
            outlier_num.append(i)

    for i in range(len(outlier_num)):
        # print(outlier_num[i]-i)
        del box_1[outlier_num[i]-i]

    return box_1


# fig1, ax1 = plt.subplots(figsize=(6, 5))  # set the size of canvas
datafile1 = 'energy_amy_20210524.xlsx'
box_amy_1, box_amy_2, box_amy_3=box_plot(datafile1)
print(np.mean(box_amy_1))
print(np.var(box_amy_1))
print(np.std(box_amy_1, ddof=1))
print(np.mean(box_amy_2))
print(np.var(box_amy_2))
print(np.std(box_amy_2, ddof=1))
print(np.mean(box_amy_3))
print(np.var(box_amy_3))
print(np.std(box_amy_3, ddof=1))
# plt.title('boxplot_amy', fontsize=20)  # title, and set the fontsize
plt.text(1.4,4.5,r'$p<10^{-4}$')
plt.text(2.4,4.5,r'$p<10^{-4}$')
plt.text(1.6,3.3,r'$p<10^{-4}$')
plt.quiver(1, 4.2, 1, 0, color='red', width=0.003, scale=3)
plt.quiver(2, 4.2, 1, 0, color='red', width=0.003, scale=3)
plt.quiver(1, 3, 1, 0, color='red', width=0.003, scale=1.5)
plt.quiver(2, 4.2, -1, 0, color='red', width=0.003, scale=3)
plt.quiver(3, 4.2, -1, 0, color='red', width=0.003, scale=3)
plt.quiver(3, 3, -1, 0, color='red', width=0.003, scale=1.5)
plt.savefig('box_amy_20210524.svg',format='svg')

# plt.subplots(figsize=(6, 5))
datafile2 = 'energy_tau_20210524.xlsx'
box_tau_1, box_tau_2, box_tau_3=box_plot(datafile2)
print(np.mean(box_tau_1))
print(np.var(box_tau_1))
print(np.std(box_tau_1, ddof=1))
print(np.mean(box_tau_2))
print(np.var(box_tau_2))
print(np.std(box_tau_2, ddof=1))
print(np.mean(box_tau_3))
print(np.var(box_tau_3))
print(np.std(box_tau_3, ddof=1))
# plt.title('boxplot_tau', fontsize=20)
plt.text(1.3,3.4,r'$p=0.179$')
plt.text(2.4,3.4,r'$p<10^{-4}$')
plt.text(1.6,1.4,r'$p<10^{-4}$')
plt.quiver(1, 3, 1, 0, color='red', width=0.003, scale=3)
plt.quiver(2, 3, 1, 0, color='red', width=0.003, scale=3)
plt.quiver(1, 1, 1, 0, color='red', width=0.003, scale=1.5)
plt.quiver(2, 3, -1, 0, color='red', width=0.003, scale=3)
plt.quiver(3, 3, -1, 0, color='red', width=0.003, scale=3)
plt.quiver(3, 1, -1, 0, color='red', width=0.003, scale=1.5)
plt.savefig('box_tau_new_20210524.svg',format='svg')

# plt.subplots(figsize=(6, 5))
datafile2 = 'energy_ct_20210711.xlsx'
box_tau_1, box_tau_2, box_tau_3=box_plot(datafile2)
print(np.mean(box_tau_1))
print(np.var(box_tau_1))
print(np.std(box_tau_1, ddof=1))
print(np.mean(box_tau_2))
print(np.var(box_tau_2))
print(np.std(box_tau_2, ddof=1))
print(np.mean(box_tau_3))
print(np.var(box_tau_3))
print(np.std(box_tau_3, ddof=1))
# plt.title('boxplot_tau', fontsize=20)
plt.text(1.3,17.4,r'$p=0.0304$')
plt.text(2.4,17.4,r'$p=0.0167$')
plt.text(1.6,15.4,r'$p<10^{-4}$')
plt.quiver(1, 17, 1, 0, color='red', width=0.003, scale=3)
plt.quiver(2, 17, 1, 0, color='red', width=0.003, scale=3)
plt.quiver(1, 15, 1, 0, color='red', width=0.003, scale=1.5)
plt.quiver(2, 17, -1, 0, color='red', width=0.003, scale=3)
plt.quiver(3, 17, -1, 0, color='red', width=0.003, scale=3)
plt.quiver(3, 15, -1, 0, color='red', width=0.003, scale=1.5)
plt.savefig('box_ct_new_20210524.svg',format='svg')

# plt.subplots(figsize=(6, 5))
datafile3 = 'energy_fdg_20210524.xlsx'
box_fdg_1, box_fdg_2, box_fdg_3=box_plot(datafile3)
print(np.mean(box_fdg_1))
print(np.var(box_fdg_1))
print(np.std(box_fdg_1, ddof=1))
print(np.mean(box_fdg_2))
print(np.var(box_fdg_2))
print(np.std(box_fdg_2, ddof=1))
print(np.mean(box_fdg_3))
print(np.var(box_fdg_3))
print(np.std(box_fdg_3, ddof=1))
# plt.title('boxplot_fdg', fontsize=20)
plt.text(1.4,2.2,r'$p=0.393$')
plt.text(2.4,2.2,r'$p<10^{-4}$')
plt.text(1.6,1.8,r'$p<10^{-4}$')
plt.quiver(1, 2.1, 1, 0, color='red', width=0.003, scale=3)
plt.quiver(2, 2.1, 1, 0, color='red', width=0.003, scale=3)
plt.quiver(1, 1.7, 1, 0, color='red', width=0.003, scale=1.5)
plt.quiver(2, 2.1, -1, 0, color='red', width=0.003, scale=3)
plt.quiver(3, 2.1, -1, 0, color='red', width=0.003, scale=3)
plt.quiver(3, 1.7, -1, 0, color='red', width=0.003, scale=1.5)
plt.savefig('box_fdg_20210524.svg',format='svg')
plt.show()

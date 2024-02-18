# library
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from mpl_toolkits.axes_grid1 import make_axes_locatable
import math


def circular_plot(datafile, datafile1):
    # create data
    # 创建数据
    size_of_groups = np.ones([60])/80
    data = pd.read_excel(datafile)
    data_p = data.values
    data_p = data_p.astype(float)
    data_p = data_p.tolist()
    data_pe = np.zeros([60])
    for i in range(60):
        data_pe[i]=data_p[i][0]
    print(data_pe)
    print(type(data_pe))

    # Fisher score


    # inner data
    size_of_groups1 = np.ones([60]) / 80
    data1 = pd.read_excel(datafile1)
    data_p1, data_p2, data_p3, data_p4 = data1['CN'].values, data1['EMCI'].values, data1['LMCI'].values, data1['E_MAX'].values
    data_p1 = data_p1.astype(float)
    data_p1 = data_p1.tolist()
    data_pe1 = np.zeros([60])
    for i in range(60):
        data_pe1[i] = data_p1[i]
    print(data_pe1)
    print(type(data_pe1))

    data_p2 = data_p2.astype(float)
    data_p2 = data_p2.tolist()
    data_pe2 = np.zeros([60])
    for i in range(60):
        data_pe2[i] = data_p2[i]
    print(data_pe2)
    print(type(data_pe2))

    data_p3 = data_p3.astype(float)
    data_p3 = data_p3.tolist()
    data_pe3 = np.zeros([60])
    for i in range(60):
        data_pe3[i] = data_p3[i]
    print(data_pe3)
    print(type(data_pe3))

    data_p4 = data_p4.astype(float)
    data_p4 = data_p4.tolist()
    data_pe4 = np.zeros([60])
    for i in range(60):
        data_pe4[i] = data_p4[i]
    print(data_pe4)
    print(type(data_pe4))

    # 标签数据
    names = np.zeros([60])
    for i in range(60):
        names[i]=i+1
    names = names.astype(int)
    names = names.tolist()
    print(names)
    print(type(names))

    # 各个值对应相应的颜色
    # norm = colors.Normalize(data_pe.min(), data_pe.max())
    # colors = cm.jet(norm(data_pe))

    emp = np.zeros([60], dtype=float)
    # 统计 p 小于 0.01 的 index 值
    for i in range(60):
        # print(i)
        if data_pe[i]>0.008:
            print(i+1)
            emp[i]=data_pe.max()

    print(emp)
    import matplotlib.colors as colors
    import matplotlib.cm as cm

    norm = colors.Normalize(emp.min(), emp.max())
    print(norm)
    emps = cm.jet(norm(emp))

    # Create a pieplot
    # 创建饼图
    print(data_pe.max())
    cm = plt.cm.get_cmap('jet')
    colors = cm(data_pe/data_pe.max())
    colors1 = cm(data_pe1*2)#/data_pe4
    colors2 = cm(data_pe2*2)#/data_pe4
    colors3 = cm(data_pe3*2)#/data_pe4
    print(colors)
    fig1, ax1 = plt.subplots(figsize=(7,7))
    wedges, texts = ax1.pie(size_of_groups, radius=1.0, colors=colors, startangle=90, wedgeprops=dict(width=0.1, edgecolor='w'))
    ax1.pie(size_of_groups1, radius=0.8, colors=colors1, startangle=90, wedgeprops=dict(width=0.1, edgecolor='w'))
    ax1.pie(size_of_groups1, radius=0.7, colors=colors2, startangle=90, wedgeprops=dict(width=0.1, edgecolor='w'))
    ax1.pie(size_of_groups1, radius=0.6, colors=colors3, startangle=90, wedgeprops=dict(width=0.1, edgecolor='w'))

    for i in range(60):
        theta = math.pi / 2 - (names[i] - 0.5) * math.pi / 40
        print(theta)
        ax1.text(-1.04*math.sin((names[i]-0.5)*math.pi/40)-0.04, 1.04*math.cos((names[i]-0.5)*math.pi/40)-0.02, names[i], rotation=-theta*180/math.pi, color=emps[i])

    # add a circle at the center
    # 添加一个圆
    # my_circle=plt.Circle((0,0), 0.85, color='white')
    # # 获得当前显示的图表，也就是前面画的饼图
    # p=plt.gcf()
    # # 将两图相加
    # p.gca().add_artist(my_circle)

    # 设置等比例轴， x 和 y 轴等比例
    ax1.axis('equal')

    fig2, ax2 = plt.subplots(figsize=(6,2))
    # ax2.axis('equal')
    xy = range(1)
    z = xy
    sc = ax2.scatter(xy, xy, c=z, vmin=data_pe.min(), vmax=data_pe.max(), s=0, cmap=cm)
    ax2.spines['top'].set_visible(False)
    ax2.spines['right'].set_visible(False)
    ax2.spines['bottom'].set_visible(False)
    ax2.spines['left'].set_visible(False)
    # y 轴不可见
    ax2.axes.get_yaxis().set_visible(False)
    # x 轴不可见
    ax2.axes.get_xaxis().set_visible(False)

    divider = make_axes_locatable(plt.gca())
    cax = divider.append_axes("right", size="5%", pad="-10%")
    c = plt.colorbar(sc, cax=cax, shrink = 0.02)# , orientation="horizontal"
    cax.xaxis.set_ticks_position("top")
    c.ax.tick_params(labelsize=6)  #设置色标刻度字体大小
    font = {'family' : 'serif',
            'color'  : 'darkred',
            'weight' : 'normal',
            'size'   : 10,
            }
    c.set_label('fisher score',fontdict=font) #设置colorbar的标签字体及其大小
    return fig1, fig2


# # datafile1 = 'p_amy.xlsx'
# # datafile2 = 'energy_node_amy.xlsx'
# datafile1 = 'fisher_amy.xlsx'
# datafile2 = 'energy_node_e_amy.xlsx'
# fig1, fig2 = circular_plot(datafile1, datafile2)
# fig1.savefig('circular_amy.png')
# fig2.savefig('colorbar_amy.png')

# # datafile3 = 'p_tau.xlsx'
# # datafile4 = 'energy_node_tau.xlsx'
# datafile3 = 'fisher_tau.xlsx'
# datafile4 = 'energy_node_e_tau.xlsx'
# fig1, fig2 = circular_plot(datafile3, datafile4)
# fig1.savefig('circular_tau.png')
# fig2.savefig('colorbar_tau.png')

# datafile5 = 'p_fdg.xlsx'
# datafile6 = 'energy_node_fdg.xlsx'
datafile5 = 'fisher_fdg_new.xlsx'
datafile6 = 'energy_node_e_fdg_new.xlsx'
fig1, fig2 = circular_plot(datafile5, datafile6)
fig1.savefig('circular_fdg_new.png')
fig2.savefig('colorbar_fdg_new.png')

plt.show()

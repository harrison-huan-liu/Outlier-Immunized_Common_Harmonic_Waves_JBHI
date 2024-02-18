# coding:utf-8
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.font_manager as fm
import matplotlib

def excel_one_line_to_list(address, result):
    df = pd.read_excel(address, usecols=[1], names=None)  # 读取第一列，不要列名
    # print(df)
    df_li = df.values.tolist()

    for s_li in df_li:
        result.append(s_li[0])
    return result

matplotlib.rcParams['backend'] = 'SVG'
ave1ad = 'D:\\research\\Nonliner Dimensional Reduction\\Brian_network_harmonics\\common_harmonic_wave_original\\ave1.xlsx'
sss1ad = 'D:\\research\\Nonliner Dimensional Reduction\\Brian_network_harmonics\\common_harmonic_wave_original\\sss1.xlsx'
ave2ad = 'D:\\research\\Nonliner Dimensional Reduction\\Brian_network_harmonics\\common_harmonic_wave_original\\ave2.xlsx'
sss2ad = 'D:\\research\\Nonliner Dimensional Reduction\\Brian_network_harmonics\\common_harmonic_wave_original\\sss2.xlsx'
x1ad = 'D:\\research\\Nonliner Dimensional Reduction\\Brian_network_harmonics\\common_harmonic_wave_original\\x1.xlsx'
x2ad = 'D:\\research\\Nonliner Dimensional Reduction\\Brian_network_harmonics\\common_harmonic_wave_original\\x2.xlsx'

ave1 = []
sss1 = []
ave2 = []
sss2 = []
x1 = []
x2 = []

excel_one_line_to_list(ave1ad, ave1)
excel_one_line_to_list(sss1ad, sss1)
excel_one_line_to_list(ave2ad, ave2)
excel_one_line_to_list(sss2ad, sss2)
excel_one_line_to_list(x1ad, x1)
excel_one_line_to_list(x2ad, x2)

# x1 = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50]
# # m1 = [0.000556285, 0.000615462, 0.000593395, 0.000539446, 0.000588581, 0.000611463, 0.000599982, 0.000614791, 0.000651233, 0.00064513]
# # m1 = [0.00539446, 0.00556285, 0.00588581, 0.00593395, 0.00615462, 0.00611463, 0.00599982, 0.00614791, 0.0064513, 0.00651233]
# m1 = [2.44539446, 2.44556285, 2.44588581, 2.44593395, 2.44615462, 2.44611463, 2.44599982, 2.44614791, 2.4464513, 2.44651233]
#
# y1 = [0.000170076, 0.000180781, 0.00019454, 0.000180928, 0.000200935, 0.000214386, 0.00025818, 0.00024146, 0.000301357, 0.000228434]
#
#
# x2 = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50]
# # m2 = [0.000855002, 0.000963141, 0.00093059, 0.00095267, 0.000971682, 0.001048255, 0.001073421, 0.001128569, 0.001192527, 0.001163189]
# # m2 = [0.00855002, 0.0093059, 0.0095267, 0.00963141, 0.00971682, 0.01048255, 0.01073421, 0.01128569, 0.01163189, 0.01192527]
# m2 = [2.44855002, 2.4493059, 2.4495267, 2.44963141, 2.44971682, 2.45048255, 2.45073421, 2.45128569, 2.45163189, 2.45192527]
#
# y2 = [0.000309081, 0.000310643, 0.000392278, 0.000421481, 0.000401075, 0.000597248, 0.000507873, 0.000523909, 0.000592657, 0.000592309]


m1 = np.array(ave2)
m2 = np.array(ave1)
y1 = np.array(sss2)
y2 = np.array(sss1)


plt.errorbar(x1, m1, yerr=y1, fmt='r-o', lw=1.5, ecolor='r', elinewidth=1, ms=5, capsize=2, label='Geometric mean')
plt.fill_between(x2, m2-y2, m2+y2, color='LightSteelBlue')
plt.fill_between(x1, m1-y1, m1+y1, color='LightPink')
plt.errorbar(x2, m2, yerr=y2, fmt='b-^', lw=1.5, ecolor='b', elinewidth=1, ms=5, capsize=2, label='Fréchet mean')

# x = np.arange(20, 350)
# l1 = plt.plot(x1, y1, 'r--', label='geometric median')
# l2 = plt.plot(x2, y2, 'g--', label='frechet mean')
# plt.plot(x1, y1, 'ro-', x2, y2, 'g+-')

# plt.title('the robustness to Outliers')
# plt.axis([0, 55, 2.444, 2.454])
ax=plt.gca()
ax.spines['right'].set_color('none')
ax.spines['top'].set_color('none')
plt.xlabel('Proportion of outliers')
plt.ylabel('Distance on manifold')
plt.legend(frameon=False, loc='upper center')# best
plt.tight_layout()
print(x2)
print(m2)
for i in range(0,34):
    ax.text(x2[i], m2[i]+y2[i]+0.00001, r'$*$', color='red', ha='center', va='bottom', fontsize=14)
plt.savefig('lineplot_outliers20210704.svg')
plt.show()

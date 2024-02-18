# import numpy as np
# import matplotlib.pyplot as plt
#
# a = np.random.normal(0, 3, 1000)
# b = np.random.normal(2, 4, 900)
#
# bins = np.linspace(-10, 10, 50)
#
# plt.hist(a, bins, alpha = 0.5, label='a')
# plt.hist(b, bins, alpha = 0.5, label='b')
# plt.legend(loc='upper left')
#
# plt.show()

# from matplotlib import pyplot as plt
# import numpy as np
#
# train_x = np.linspace(-1, 1, 100)
# train_y_1 = 2 * train_x + np.random.rand(*train_x.shape) * 0.3
# train_y_2 = train_x ** 2 + np.random.randn(*train_x.shape) * 0.3
#
# p1 = plt.scatter(train_x, train_y_1, c='red', marker='v')
# p2 = plt.scatter(train_x, train_y_2, c='blue', marker='o')
# print(p1)
# legend = plt.legend([p1, p2], ["CH", "US"], facecolor='blue')
#
# plt.show()

# from math import pi
# import pandas as pd
# from bokeh.io import output_file, show
# from bokeh.palettes import Category20c
# from bokeh.plotting import figure
# from bokeh.transform import cumsum
# from bokeh.models import LabelSet, ColumnDataSource
#
# output_file("pie.html")
#
# x = {
#     'United States': 157,
#     'United Kingdom': 93,
#     'Japan': 89,
#     'China': 63,
#     'Germany': 44,
#     'India': 42,
#     'Italy': 40,
#     'Australia': 35,
#     'Brazil': 32,
#     'France': 31,
#     'Taiwan': 31,
#     'Spain': 29,
#     'India': 42,
#     'Italy': 40,
#     'Australia': 35,
#     'Brazil': 32,
#     'France': 31,
#     'Taiwan': 31,
#     'Spain': 29
# }
#
# data = pd.Series(x).reset_index(name='value').rename(columns={'index':'country'})
# data['angle'] = 2 * pi / 60 # data['value']/data['value'].sum() * 2*pi
# data['color'] = Category20c[len(x)]
#
# p = figure(plot_height=1050, title="Pie Chart", toolbar_location=None,
#            tools="hover", tooltips="@country: @value", x_range=(-0.5, 0.5))
#
# p.wedge(x=0, y=1.0, radius=1,
#         start_angle=cumsum('angle', include_zero=True), end_angle=cumsum('angle'),
#         line_color="white", fill_color='color', source=data)
#
# data["value"] = data['value'].astype(str)
# data["value"] = data["value"].str.pad(60, side = "left")
# source = ColumnDataSource(data)
#
# labels = LabelSet(x=0, y=1, text='value',
#         angle=cumsum('angle', include_zero=True), source=source, render_mode='canvas')
#
# p.add_layout(labels)
#
# p.axis.axis_label=None
# p.axis.visible=False
# p.grid.grid_line_color = None
#
# show(p)

# 饼图
from openpyxl import Workbook
from openpyxl.chart import PieChart, Reference
from openpyxl.chart.label import DataLabelList
from openpyxl.chart.text import RichText
from openpyxl.drawing.text import Paragraph, ParagraphProperties, CharacterProperties


wb = Workbook()
ws_PieChart = wb.active
data = [
      ['label', ''],
      ['海尔净水', 3],
      ['海尔热水器', 3],
      ['小帅影院', 3]
]
for row in data:
    ws_PieChart.append(row)

#####
#使用：openpyxl.chart.PieChart() 来实例化创建 PieChart饼图
pie = PieChart()
labels = Reference(ws_PieChart, min_col=1, min_row=2, max_row=4)
data = Reference(ws_PieChart, min_col=2, min_row=1, max_row=4)

pie.add_data(data, titles_from_data=True)
pie.set_categories(labels)
pie.style = 10  # 图表样式类型 共48种 详见上篇博文介绍
pie.height = 20  # 图表高度
pie.width = 50   # 图表宽度
s1 = pie.series[0]
# s1.graphicalProperties.line.solidFill = 'FF0000'    # 图表边缘线条颜色
# s1.graphicalProperties.line.width = 100000      # 图表边缘线条宽度
s1.dLbls = DataLabelList()
s1.dLbls.showCatName = True     # 标签显示
s1.dLbls.showVal = True     # 数量显示
s1.dLbls.showPercent = True     # 百分比显示
axis = CharacterProperties(sz=1800)     # 图表中字体大小 *100
s1.dLbls.txPr = RichText(p=[Paragraph(pPr=ParagraphProperties(defRPr=axis), endParaRPr=axis)])

ws_PieChart.add_chart(pie, 'D16')   # 放置图表位置

wb.save(r'piechart.xlsx')

# annotate()函数作用为公式注释。参数：r（红色）；'$x^3=%s$'（美元符中写要添加的公式注释）； % y0 （将y0的值放到%s中）；
# xy=(x0, y0),将点x0与y0存入变量xy中； xytext=(+30, -30),以点（x0, y0）为起点向正方向移动30，向负方向移动30；
# textcoords = 'offset points',公式的描述以（x0,y0）为起点； fontsize=16,公式描述的大小围殴16
# arrowprops=dict()箭头设置；arrowstyle='->',添加箭头； connectionstyle='arc3（箭头风格）,rad=.2（箭头弧度）'。
# plt.annotate(r'$x^3=%s$' % y0, xy=(x0, y0), xytext=(+30, -30), textcoords='offset points', fontsize=16,
             # arrowprops=dict(arrowstyle='->', connectionstyle='arc3,rad=.2'))

# text()函数在坐标轴上添加文本描述。参数：文本以(-1.5,1)为起点；r'$this\ is\ the\ text$'，添加的内容；
# fontdict={'size': '16'文字大小, 'color': 'r'文本颜色}文本的大小参数。
# plt.text(-2, 2, r'$this\ is\ a\ function$', fontdict={'size': '16', 'color': 'r'})

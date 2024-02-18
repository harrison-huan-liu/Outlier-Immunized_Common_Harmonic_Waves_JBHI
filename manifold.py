import numpy as np
import math
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

fig = plt.figure()
ax = plt.axes(projection='3d')
fig = plt.figure()
ax1 = plt.axes(projection='3d')

#曲面
x = np.arange(-4,4,0.5)
y = np.arange(-4,4,0.5)
X, Y = np.meshgrid(x,y)
# Z = 2 - np.power(X, 3) + np.power(Y, 3)
# Z = 0.1*(1/2*math.pi*2.1**2)*np.exp(-((X-0.65)**2+(Y+0.6)**2)/2*2.1**2) + 0.1*(1/2*math.pi*2.1**2)*np.exp(-((X+0.6)**2+(Y-0.7)**2)/2*2.1**2) + 0.1*(1/2*math.pi*2**2)*np.exp(-((X+0.8)**2+(Y+0.8)**2)/2*2**2) + 0.1*(1/2*math.pi*2.2**2)*np.exp(-((X-0.7)**2+(Y-0.65)**2)/2*2.2**2) - 0.01*(1/2*math.pi*1.9**2)*np.exp(-((X-0.1)**2+Y**2)/2*1.9**2)+0.1*(1/2*math.pi*2**2)*np.exp(-((X-0.7)**2+Y**2)/2*2**2) + 0.1*(1/2*math.pi*2**2)*np.exp(-(X**2+(Y-0.8)**2)/2*2**2)+0.1*(1/2*math.pi*2**2)*np.exp(-(X**2+(Y+0.7)**2)/2*2**2) + 0.1*(1/2*math.pi*2**2)*np.exp(-((X+0.8)**2+Y**2)/2*2**2)
Z1 = X/X
Z = 0.02*(X*np.sin(X)+Y*np.cos(Y))

#散点
xd=2*math.pi*np.random.random(10)-math.pi
yd=2*math.pi*np.random.random(10)-math.pi
# zd= 2 - np.power(xd, 3) + np.power(yd, 3)
# zd = 0.1*(1/2*math.pi*2.1**2)*np.exp(-((xd-0.65)**2+(yd+0.6)**2)/2*2.1**2) + 0.1*(1/2*math.pi*2.1**2)*np.exp(-((xd+0.6)**2+(yd-0.7)**2)/2*2.1**2) + 0.1*(1/2*math.pi*2**2)*np.exp(-((xd+0.8)**2+(yd+0.8)**2)/2*2**2) + 0.1*(1/2*math.pi*2.2**2)*np.exp(-((xd-0.7)**2+(yd-0.65)**2)/2*2.2**2) - 0.01*(1/2*math.pi*1.9**2)*np.exp(-((xd-0.1)**2+yd**2)/2*1.9**2)+0.1*(1/2*math.pi*2**2)*np.exp(-((xd-0.7)**2+yd**2)/2*2**2) + 0.1*(1/2*math.pi*2**2)*np.exp(-(xd**2+(yd-0.8)**2)/2*2**2)+0.1*(1/2*math.pi*2**2)*np.exp(-(xd**2+(yd+0.7)**2)/2*2**2) + 0.1*(1/2*math.pi*2**2)*np.exp(-((xd+0.8)**2+yd**2)/2*2**2)
zd =  0.02*(xd*np.sin(xd)+yd*np.cos(yd))

#作图
ax.scatter3D(xd,yd,zd,color='red')  #绘制散点图
ax.plot_surface(X,Y,Z,rstride=1, cstride=1,cmap='winter',alpha=1)
plt.xticks([])
plt.yticks([])
plt.axis('off')
ax1.plot_surface(X,Y,Z1,rstride=1, cstride=1,cmap='winter',alpha=1)

#ax3.contour(X,Y,Z, zdim='z',offset=-2，cmap='rainbow)   #等高线图，要设置offset，为Z的最小值
ax.set_xlim(-7,7)
ax.set_ylim(-7,7)
ax.set_zlim(0,1)
plt.xticks([])
plt.yticks([])
plt.axis('off')
plt.show()
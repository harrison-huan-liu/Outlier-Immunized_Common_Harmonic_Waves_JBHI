import imagesc as imagesc
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

X1=np.random.rand(24**2).reshape(24,24)-0.8
for i in range(24):
    for j in range(24):
        if X1[i,j]<0:
            X1[i,j]=0

X1=np.triu(X1)
X1 += X1.T - np.diag(X1.diagonal())

X2=np.random.rand(24**2).reshape(24,24)-0.8
for i in range(24):
    for j in range(24):
        if X2[i,j]<0:
            X2[i,j]=0

X2=np.triu(X2)
X2 += X2.T - np.diag(X2.diagonal())
# imagesc.plot(X, vmax=1)
Y=np.zeros((24,24))
Y=np.random.rand(24**2).reshape(24,24)-0.95
for i in range(24):
    for j in range(24):
        if Y[i,j]<0:
            Y[i,j]=0
# Z=([[X,Y],
# [Y,X]])
Z1=np.hstack([X1, Y])
Z2=np.hstack([np.transpose(Y), X2])
Z=np.vstack([Z1,Z2])

fig, ax = plt.subplots()
# Z=([[0.,        0.54365283, 0.47871999, 0.45993082, 0.26225798, 0.,
#   0.,         0.,         0.,         0.        ],
#  [0.54365283, 0.,         0.57149283, 0.53654245, 0.25752233, 0.,
#   0.,         0.,         0.,         0.        ],
#  [0.47871999, 0.57149283, 0.,         0.21400149, 0.0675765,  0.,
#   0.,         0.16722375, 0.,         0.00262306],
#  [0.45993082, 0.53654245, 0.21400149, 0.,         0.,         0.,
#   0.00094964, 0.,         0.,         0.        ],
#  [0.26225798, 0.25752233, 0.0675765,  0.,         0.19134985, 0.,
#   0.,         0.,         0.,         0.        ],
#  [0.,         0.,         0.,         0.,         0.,         0.,
#   0.,         0.51915884, 0.22472028, 0.29616524],
#  [0.,         0.,         0.,         0.00094964, 0.,         0.,
#   0.36790281, 0.,         0.,         0.        ],
#  [0.,         0.,         0.16722375, 0.,         0.,         0.51915884,
#   0.,         0.,         0.,         0.26510435],
#  [0.,         0.,         0.,         0.,         0.,         0.22472028,
#   0.,         0.,         0.,         0.11976024],
#  [0.,         0.,         0.00262306, 0.,         0.,         0.29616524,
#   0.,         0.26510435, 0.11976024, 0.        ]])
a = ax.imshow(Z, extent=[0, 1, 0, 1], cmap='YlOrBr')#Blues,BuGn,YlOrBr,jet,rainbow
plt.xticks([])
plt.yticks([])
plt.colorbar(a)
plt.savefig('colormatrix15.png')
print(Z)
plt.show()

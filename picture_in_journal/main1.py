import plotly.graph_objects as go

import pandas as pd

# D:\Python code\Energy_Null_model.csv
df = pd.read_excel("energy_amy.xlsx")

fig = go.Figure()

Labels = ['Cortical thickness','Amyloid deposition']


for Label in Labels:
    fig.add_trace(go.Violin(x=df['Label'][df['Label'] == Label],
                            y=df['P value'][df['Label'] == Label],
                            name=Label,
                            box_visible=True,
                            meanline_visible=True))

fig.show()

# Import dependencies
import dash
import dash_core_components as dcc
import dash_html_components as html
import plotly.graph_objects as go
from dash.dependencies import Input, Output
import pandas as pd

data = pd.read_csv(r'C:\Users\aviparna.biswas\OneDrive - Nexval\Documents\R\COVID\Covid_R\COVID19_line_list_data.csv')
data.head()

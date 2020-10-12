import dash
from dash.dependencies import Input, Output
import dash_html_components as html 
import dash_core_components as dcc
import numpy as np
import plotly.express as px

app = dash.Dash(__name__)
server = app.server

app.layout = html.Div(
    [
        html.H3("demoapp"),
        dcc.Slider(
            id="slider",
            min=0,
            max=3.14,
            step=0.1,
            value=0
        ),
        dcc.Graph(id="graph")
    ]
)

@app.callback(
    Output("graph", "figure"),
    [Input("slider", "value")]
)
def update_graph(val):
    x = np.linspace(0,5,100)
    y = np.sin(5*(x + val))*np.exp(-0.3*x*(1+val))*(x-1)**2
    fig = px.line(x=x, y=y)
    return fig

if __name__=="__main__":
    app.run_server(debug=True)
from fastapi import FastAPI
from fastapi.responses import HTMLResponse
from connector import yearMostRaced,trackMostRaced,driverMostWins,driverConsAmeBri


app = FastAPI()

#Get con la documentacion, devuelve un html
@app.get('/',response_class=HTMLResponse)
async def root():
    return """<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Science - Proyecto Individual 1</title>
</head>
<body>
    <h1>Documentacion API</h1>
    <h3>/ymr</h3>
    <p>Devuelve un diccionario que contiene la clave ymr con el valor del año con mas carreras</p>
    <h3>/tmr</h3>
    <p>Devuelve un diccionario que contiene la clave tmr con el valor del circuito que mas veces se corrio</p>
    <h3>/dmw</h3>
    <p>Devuelve un diccionario que contiene la clave dmw con el valor del piloto con mas victorias</p>
    <h3>/dcab</h3>
    <p>Devuelve un diccionario que contiene la clave tmr con el valor del piloto con mas puntos con constructor "American" o "British</p>
</body>
</html>"""

#Get año con mas carreras
@app.get('/ymr')
async def ymr():
    return {'ymr': yearMostRaced()}

#Get circuito mas corrido
@app.get('/tmr')
async def tmr():
    return {'tmr':trackMostRaced()}

#Get piloto con mas victorias
@app.get('/dmw')
async def dmw():
    return {'dmw':driverMostWins()}


#Get piloto con mas puntos con constructor "American" o "British"
@app.get('/dcab')
async def dcab():
    return {'dcab':driverConsAmeBri()}
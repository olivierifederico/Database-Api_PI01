from fastapi import FastAPI
from connector import yearMostRaced,trackMostRaced,driverMostWins,driverConsAmeBri


app = FastAPI()

#Get con la documentacion
@app.get('/')
async def root():
    return 'Data Science - Proyecto Individual 1'

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
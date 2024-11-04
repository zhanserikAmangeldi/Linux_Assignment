from fastapi import FastAPI
import logging

logging.basicConfig(filename='/home/logs/app.log', level=logging.DEBUG, format='%(asctime)s - %(levelname)s - %(message)s fdsaaaaaaaaaaaaaafdsafffdffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfassssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaafdjsak')
logger = logging.getLogger(__name__)



app = FastAPI()

@app.get("/")
async def root():
    logger.info("Robot endpoint was called")
    return {"message": "Hello World!\n"}


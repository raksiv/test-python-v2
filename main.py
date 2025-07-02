import os
from fastapi import FastAPI, HTTPException, Request
from fastapi.responses import PlainTextResponse

from nitric.client import NitricClient

app = FastAPI()
nitric = NitricClient()

@app.get("/")
async def hello():
    return PlainTextResponse("Hello, World!")

@app.get("/read/{name}")
async def read_from_bucket(name: str):
    try:
        contents = await nitric.image.read(name)
        return PlainTextResponse(contents.decode("utf-8"))
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.post("/write/{name}")
async def write_to_bucket(name: str, request: Request):
    try:
        body = await request.body()
        await nitric.image.write(name, body)
        return PlainTextResponse(f"File '{name}' written to bucket.")
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
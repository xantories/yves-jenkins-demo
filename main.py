from fastapi import FastAPI
from fastapi.responses import PlainTextResponse

app = FastAPI()

@app.get("/", response_class=PlainTextResponse)
def read_root():
    return "Hello, World!"

@app.get("/user/{name}", response_class=PlainTextResponse)
def read_user(name: str):
    return f"Hello {name}" 
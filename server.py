"""
FastAPI Server for chatbot API
"""

from fastapi import FastAPI

app = FastAPI()


@app.get("/")
async def root():
    """
    Root endpoint
    :return: Hello World
    """
    return { "message": "Hello World" }


if __name__ == "__main__":
    import uvicorn

    uvicorn.run("server:app", reload=True)
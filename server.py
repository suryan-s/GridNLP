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


@app.get("/chatbot/")
async def chatbot(question: str = 'No question'):
    """
    Chatbot endpoint
    :param question: question to ask the chatbot
    :return: Hello World
    Method of calling the api endpoint:
    http://localhost:8000/chatbot/?question=Hello
    """
    return { "message": f"you have asked: {question}" }


if __name__ == "__main__":
    import uvicorn

    uvicorn.run("server:app", reload=True)
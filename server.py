"""
FastAPI Server for chatbot API
"""

from fastapi import FastAPI
from bot.utils import get_bot_response

app = FastAPI()


@app.get("/")
async def root():
    """
    Root endpoint
    :return: Hello World
    """
    return { "message": "Bot up and working!" }, 200


@app.get("/chatbot/")
async def chatbot(question: str):
    """
    Chatbot endpoint
    Method of calling the api endpoint:
    http://localhost:8000/chatbot/?question=Hello
    :param question: Question to ask the chatbot
    :return: JSON response with the chatbot's answer
    :status 200: Successfully received the chatbot's response
    :status 400: Bad request (e.g., no question provided)
    :status 500: Internal server error (if there's an issue with the chatbot logic)
    """
    if not question:
        return { "error": "No question provided" }, 400
    try:
        answer = get_bot_response(question)
        return { "response": answer }, 200
    except Exception as e:
        return { "error": str(e) }, 500


if __name__ == "__main__":
    import uvicorn

    uvicorn.run("server:app", use_colors=True, workers=2)
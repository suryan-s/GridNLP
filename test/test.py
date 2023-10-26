from fastapi.testclient import TestClient
import httpx
from server import app

# Create a test client
client = TestClient(app)


def test_root_endpoint():
    # Send a GET request to the root endpoint
    response = client.get("/")

    # Check the response status code
    assert response.status_code == 200

    # Check the response content
    assert response.json() == { "message": "Hello World" }
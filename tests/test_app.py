import os
import pytest
import sys


sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from app import app


@pytest.fixture
def client():
    """A test client for the app."""
    app.config['TESTING'] = True  # Set app to testing mode
    with app.test_client() as client:
        yield client


def test_main_route(client):
    """Test the main route ("/")"""
    response = client.get("/")
    assert response.status_code == 200
    assert b"Welcome!" in response.data  # Check if 'Welcome!' is in the response


def test_hello_route(client):
    """Test the '/how are you' route"""
    response = client.get("/how are you")
    assert response.status_code == 200
    assert b"I am good, how about you?" in response.data  # Check if expected response is present

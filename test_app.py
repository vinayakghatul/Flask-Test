import pytest
from app import app
import json


@pytest.fixture
def client():
    return app.test_client()

def test_home(client):
    resp = client.get('/ping')
    assert resp.json=={"message":"Hello World! This is Vinayak's ping"}

def test_predict(client):
    test_data={"Gender" : "Male","Married" : "Unmarried","ApplicantIncome" : 50000,"Credit_History" : "Cleared Debts","LoanAmount" : 500000}
    resp=client.post('/predict',json=test_data)
    assert resp.status_code == 200
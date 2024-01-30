# To build base image which we got from dockerhub which has as OS and python installed
FROM python:3.8-slim-buster
# In that mini computer, create folder called flask-docker
WORKDIR /flask-docker
# Since my python version is old, upgrade my pip
RUN python3 -m pip install --upgrade pip
# Copy requrements file from local computer to mini computer
COPY requirements.txt requirements.txt
# Run the pip install to install requirements in the mini computer
RUN pip install -r requirements.txt

COPY . .

CMD [ "python3", "-m", "flask", "run", "--host=0.0.0.0" ]


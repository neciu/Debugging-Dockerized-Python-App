FROM python:3.5.0-slim

RUN apt-get update --fix-missing && \
    apt-get install -y build-essential && \
    apt-get install -y python3.4-dev && \
    apt-get install -y libpq-dev && \
    apt-get install -y git && \
    apt-get install -y libreadline-dev && \
    apt-get install -y libncurses5-dev && \
    pip install --upgrade pip

ADD requirements.txt /app/requirements.txt

WORKDIR /app

RUN ["pip", "install", "--upgrade", "pip"]
RUN ["pip", "install", "-r", "requirements.txt"]
RUN ["pip", "install", "ipython", "bpython"]
RUN ["pip", "install", "readline"]

EXPOSE 8080

CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]

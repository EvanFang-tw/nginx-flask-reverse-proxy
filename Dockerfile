FROM python:3.10.7-slim-buster

WORKDIR /app

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

# copy project
COPY ./hello.py /app
EXPOSE 8083
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8083", "hello:app", "--timeout", "5"]

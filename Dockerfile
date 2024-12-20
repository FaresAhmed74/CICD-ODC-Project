FROM python:3.9-slim

WORKDIR /app

COPY . /app

COPY requirements.txt /app

RUN pip install --no-cache-dir -r requirements.txt 

EXPOSE 5000

ENV FLASK_APP=app.py

RUN python -c "import sqlite3; sqlite3.connect('weather_data.db').close()"

CMD ["flask", "run", "--host=0.0.0.0"]

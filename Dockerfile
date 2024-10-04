FROM ubuntu:latest

WORKDIR /app

RUN apt-get update && apt-get install -y python3 python3-pip python3-venv

RUN python3 -m venv /app/venv
COPY requirements.txt requirements.txt
RUN /app/venv/bin/pip install -r requirements.txt

COPY app.py /opt/

ENV PATH="/app/venv/bin:$PATH"
ENV FLASK_APP=/opt/app.py

EXPOSE 5000
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]

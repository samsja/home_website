#FROM python:3.8-slim-buster
FROM arm64v8/python:3.8-slim-buster
#FROM balenalib/raspberry-pi-debian-python:latest


WORKDIR /app



RUN useradd -s /bin/bash -d /app samsja \
    && chown -R samsja: /app





COPY requirement.txt requirement.txt

RUN pip install -r requirement.txt

COPY src src


USER samsja


EXPOSE 5000


ENV NB_WORKERS=1

CMD  gunicorn -t 300 -b :5000 -w $NB_WORKERS src.app:app

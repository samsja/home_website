FROM python:3.8-slim-buster

WORKDIR /app


RUN useradd -s /bin/bash -d /app samsja \
    && chown -R samsja: /app





COPY requirement.txt requirement.txt
COPY src src

RUN pip install -r requirement.txt

USER samsja


EXPOSE 5000


ENV NB_WORKERS=1

CMD  gunicorn -t 300 -b :5000 -w $NB_WORKERS src.app:app  

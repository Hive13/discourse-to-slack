FROM python:3.8.16-alpine3.17


RUN mkdir -p /discourse-to-slack/src

COPY config.json  requirements.txt /discourse-to-slack/
COPY src/ /discourse-to-slack/src/

WORKDIR /discourse-to-slack

RUN python -m venv venv \
    && ./venv/bin/pip install pip --upgrade \
    && ./venv/bin/pip install -r requirements.txt


CMD ["/discourse-to-slack/venv/bin/python", "/discourse-to-slack/src/main.py"]


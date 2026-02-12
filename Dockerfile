ARG PYTHON_VERSION=3.8

FROM python:${PYTHON_VERSION}-slim

WORKDIR /app

COPY ./src/requirements.txt ./requirements.txt

RUN pip install -r requirements.txt

COPY ./src/manage.py ./manage.py
COPY ./src ./
COPY entrypoint.sh ./entrypoint.sh

RUN chmod +x ./entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["./entrypoint.sh"]

ARG PYTHON_VERSION=3.8

FROM python:${PYTHON_VERSION}-slim

WORKDIR /app

COPY ./src/requirements.txt ./requirements.txt
COPY ./src/manage.py ./manage.py
COPY ./src ./

RUN pip install -r requirements.txt && python manage.py migrate

EXPOSE 8080

ENTRYPOINT ["python"]
CMD ["manage.py", "runserver", "0.0.0.0:8080"]

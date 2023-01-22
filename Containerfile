FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN test_fastapi_full create-db
RUN test_fastapi_full populate-db
RUN test_fastapi_full add-user -u admin -p admin
EXPOSE 5000
CMD ["test_fastapi_full", "run"]

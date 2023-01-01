FROM python:3.10-bullseye as requirements-stage

WORKDIR /tmp

RUN pip install poetry

COPY ./pyproject.toml ./poetry.lock* /tmp/

RUN poetry export -f requirements.txt --output requirements.txt --without-hashes


FROM python:3.10-bullseye

WORKDIR /code
RUN mkdir -p /code/data

COPY --from=requirements-stage /tmp/requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./src /code/src
COPY o365_token.txt /code

EXPOSE 40051
EXPOSE 40052

# CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "40052"]
CMD ["python", "src/main.py"]
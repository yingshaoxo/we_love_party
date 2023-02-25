# docker build --tag yingshaoxo/weloveparty_account_auth_service .



FROM python:3.10-bullseye as requirements-stage

WORKDIR /tmp

RUN pip install poetry

COPY ./pyproject.toml ./poetry.lock* /tmp/

RUN poetry export -f requirements.txt --output requirements.txt --without-hashes



FROM ubuntu:jammy

RUN apt update
RUN apt install python3.10 -y
RUN apt install pip -y
RUN apt install git -y

RUN mkdir -p /code/data
WORKDIR /code
COPY --from=requirements-stage /tmp/requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
COPY ./src /code/src



EXPOSE 40051
EXPOSE 40052

CMD ["python3.10", "src/main.py"]

#FROM python:3.10-bullseye as middle
#
#RUN pip install nuitka patchelf ordered-set zstandard
#
#WORKDIR /code
#RUN mkdir -p /code/data
#
#COPY --from=requirements-stage /tmp/requirements.txt /code/requirements.txt
#
#RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
#
#COPY ./src /code/src
#
#RUN python -m nuitka --follow-imports --include-package=sqlalchemy,databases --standalone --onefile --remove-output --output-filename="program.run" src/main.py
#
#
#
#FROM python:3.10-bullseye as final
#WORKDIR /code
#COPY --from=middle /code/program.run /code/program.run
#
#
#
#EXPOSE 40051
#EXPOSE 40052
#
#
##CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "40052"]
##CMD ["python", "src/main.py"]
#CMD ["/code/program.run"]
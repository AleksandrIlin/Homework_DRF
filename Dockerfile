FROM python:3.12 AS builder


RUN curl -sSL https://install.python-poetry.org | python3 -


ENV PATH="/root/.local/bin:$PATH"


WORKDIR /app


COPY pyproject.toml poetry.lock* ./


RUN poetry install --no-root --no-dev

COPY . .

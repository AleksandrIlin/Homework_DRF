FROM python:3.12 AS builder

RUN curl -sSL https://install.python-poetry.org | python3 -

WORKDIR /app
ENV PATH="/root/.local/bin:${PATH}"
ENV PYTHONPATH="/app"
ENV POETRY_VIRTUALENVS_CREATE=false
COPY . .
COPY pyproject.toml poetry.lock* ./
RUN poetry shell
RUN poetry install

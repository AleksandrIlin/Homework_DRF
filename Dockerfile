FROM python:3.12 AS builder
RUN apt-get update && apt-get install -y curl dnsutils
RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf
RUN curl -sSL https://install.python-poetry.org | python3 - \
    && export PATH="$HOME/.local/bin:$PATH" \
    && poetry --version


WORKDIR /app
ENV PATH="/root/.local/bin:${PATH}"
ENV PYTHONPATH="/app"
ENV POETRY_VIRTUALENVS_CREATE=false
ENV POETRY_HTTP_TIMEOUT=120


COPY pyproject.toml poetry.lock* ./


RUN poetry install --no-root

COPY . .

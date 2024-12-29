FROM python:3.12 AS builder


RUN curl -sSL https://install.python-poetry.org | python3 - && \
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc


WORKDIR /app
ENV PATH="/root/.local/bin:${PATH}"
ENV PYTHONPATH="/app"
ENV POETRY_VIRTUALENVS_CREATE=false
ENV POETRY_HTTP_TIMEOUT=120


COPY pyproject.toml poetry.lock* ./


RUN /bin/sh -c "source ~/.bashrc && poetry install --no-root"

COPY . .

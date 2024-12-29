FROM python:3.12 AS builder
RUN curl -sSL https://install.python-poetry.org | python3 - && \
    ln -s /root/.local/bin/poetry /usr/local/bin/poetry || { echo "Poetry installation failed"; exit 1; }

# Проверка установки Poetry
RUN echo "Checking Poetry installation..." && \
    ls /root/.local/bin/ && \
    poetry --version || { echo "Poetry not found in PATH"; exit 1; }
WORKDIR /app
ENV PATH="/root/.local/bin:${PATH}"
ENV PYTHONPATH="/app"
ENV POETRY_VIRTUALENVS_CREATE=false
ENV POETRY_HTTP_TIMEOUT=120

COPY pyproject.toml poetry.lock ./
RUN poetry install --no-root -vvv
COPY . .

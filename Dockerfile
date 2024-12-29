FROM python:3.12 AS builder

RUN curl -sSL https://install.python-poetry.org | python3 - || { echo "Установка Poetry не удалась"; exit 1; }
RUN ln -s /root/.local/bin/poetry /usr/local/bin/poetry || { echo "Установка Poetry не удалась"; exit 1; }

WORKDIR /app
ENV PATH="/root/.local/bin:${PATH}"
ENV PYTHONPATH="/app"
ENV POETRY_VIRTUALENVS_CREATE=false
ENV POETRY_HTTP_TIMEOUT=120

RUN echo "Проверка установки Poetry..."
RUN ls -la /root/.local/bin/
RUN poetry --version || { echo "Poetry не найден в PATH"; exit 1; }

COPY pyproject.toml poetry.lock ./
RUN poetry install --no-root -vvv
COPY . .

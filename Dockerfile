FROM python:3.12 AS builder

# Установите Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# Добавьте Poetry в PATH
ENV PATH="/root/.local/bin:${PATH}"
ENV PYTHONPATH="/app"
ENV POETRY_VIRTUALENVS_CREATE=false

# Установите рабочую директорию
WORKDIR /app

# Копируйте файлы проекта
COPY pyproject.toml poetry.lock* ./

# Установите зависимости проекта
RUN poetry install --no-root --no-dev

COPY . .

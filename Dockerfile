FROM python:3.12-slim

# Установите зависимости системы
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Установите Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# Добавьте Poetry в PATH
ENV PATH="/root/.local/bin:$PATH"

# Установите рабочую директорию
WORKDIR /app

# Копируйте файлы проекта
COPY pyproject.toml poetry.lock* ./

# Установите зависимости проекта
RUN poetry install --no-root --no-dev

COPY . .

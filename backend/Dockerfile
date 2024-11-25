FROM python:3.11-buster

RUN pip install poetry==1.4.2

WORKDIR /app

ENV POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=1 \
    POETRY_VIRTUALENVS_CREATE=1 \
    POETRY_CACHE_DIR=/tmp/poetry_cache

COPY pyproject.toml poetry.lock ./

RUN poetry install --without dev --no-root && rm -rf $POETRY_CACHE_DIR

COPY . .

RUN poetry install --without dev

# CMD [ "poetry", "run", "bash", "./prestart.sh"]

# ENTRYPOINT [ "poetry", "run", "uvicorn", "app.main:app", "--reload" ]

CMD ["bash", "-c", "poetry run bash ./prestart.sh && poetry run uvicorn app.main:app --host 0.0.0.0 --port 8000"]
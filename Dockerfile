# Install the image
FROM python:3.12.16-slim-trixie

WORKDIR /app

RUN pip install uv

# First copy the files and sync the project to take advantage of Docker caching
COPY pyproject.toml uv.lock ./

RUN uv sync --locked

COPY main.py ./

EXPOSE 8000

CMD ["uv", "run", "uvicorn", "main:app", "--host", "0.0.0.0"]

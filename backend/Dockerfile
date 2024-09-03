# Dockerfile for FastAPI Backend
FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
RUN apt-get update && apt-get install -y bash
RUN mkdir -p /migrations/versions

COPY . .

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

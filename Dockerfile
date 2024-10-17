# Etapa 1: Build
FROM python:3.9-slim AS build
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Etapa 2: Imagem Final
FROM python:3.9-slim
WORKDIR /app
COPY --from=build /app /app
COPY app.py .
CMD ["python", "app.py"]

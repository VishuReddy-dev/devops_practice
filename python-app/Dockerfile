#stage 1-Builder
FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

#satge 2-Runtime
FROM python:3.12-slim
COPY --from=builder /install /usr/local
COPY app.py .
EXPOSE 5000
CMD ["python","app.py"]

FROM python:3.11-slim
WORKDIR /app
COPY requirements.lock .
RUN pip install --only-binary :all: --require-hashes --no-cache-dir -r requirements.lock
COPY app/ app/
COPY infra/ infra/
COPY tests/ tests/
COPY pytest.ini .coveragerc ./
USER 65532:65532
EXPOSE 5000
CMD ["python", "-m", "flask", "--app", "app.main", "run", "--host=0.0.0.0", "--port=5000"]

FROM python:3.10-slim

WORKDIR /app

# Copy scripts
COPY model/train.py ./train.py
COPY endpoints/serve.py ./serve.py
COPY requirements.txt ./

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

CMD ["gunicorn", "--bind", "0.0.0.0:8080", "serve:app"]
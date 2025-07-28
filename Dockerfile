FROM python:3.10-slim
WORKDIR /app
COPY model/train.py ./train.py
COPY endpoints/serve.py ./serve.py
RUN pip install --no-cache-dir scikit-learn joblib flask gunicorn
RUN train.py 
EXPOSE 8080
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "serve:app"]
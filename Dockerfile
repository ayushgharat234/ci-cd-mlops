FROM python:3.10-slim
WORKDIR /app
COPY model/train.py ./train.py
RUN pip install --no-cache-dir scikit-learn joblib 
CMD ["python", "train.py"]
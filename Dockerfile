FROM python:3.10-slim

WORKDIR /app

# Copy scripts
COPY model/train.py ./train.py
COPY endpoints/serve.py ./serve.py

# Install dependencies
RUN pip install --no-cache-dir scikit-learn joblib flask gunicorn

# Run training to create model
RUN python train.py

# Copy the trained model explicitly (optional, for robustness)
RUN mkdir -p models && cp models/iris_model.joblib ./models/iris_model.joblib

# Confirm model exists
RUN ls -lh ./models/iris_model.joblib

EXPOSE 8080

CMD ["gunicorn", "--bind", "0.0.0.0:8080", "serve:app"]
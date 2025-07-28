FROM python:3.10-slim

WORKDIR /app

# Copy training and serving scripts
COPY model/train.py ./train.py
COPY endpoints/serve.py ./serve.py

# Install required Python packages
RUN pip install --no-cache-dir scikit-learn joblib flask gunicorn

# Run training during build
RUN python train.py

# Expose port for serving (used later during inference)
EXPOSE 8080

# Default command: Serve model via Flask app with Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "serve:app"]
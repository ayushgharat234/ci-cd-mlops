# Importing necessary libraries
import joblib
from flask import Flask, request, jsonify
import numpy as np

app =  Flask(__name__)

model = joblib.load("models/iris_model.joblib")

# Endpoint for prediction
@app.route('/predict', methods=['POST'])
def predict():
    try:
        data = request.get_json()
        input_features = np.array(data['instances'])
        predictions = model.predict(input_features).to_list()
        return jsonify({'predictions': predictions})
    except Exception as e:
        return jsonify({'error': str(e)}), 400
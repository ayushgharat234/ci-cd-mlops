# This code is simple for demonstration purposes only and building understanding of the CI-CD pipeline in MLOps.
# Disclaimer: This code later may upgrade to a more complex version for production use.

import joblib
from sklearn.datasets import load_iris
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
import os

# Function to load the dataset, train and save the model
def model():
    try:
        # Loading the iris dataset
        X, y = load_iris(return_X_y=True)

        # Splitting the dataset into training and testing sets
        X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

    except:
        print("Error loading dataset")
        return
    
    try:
        # Creating a logistic regression model
        model = LogisticRegression(max_iter=200)
        model.fit(X_train, y_train)

        # Evaluate model
        accuracy = model.score(X_test, y_test)
        print(f"Model accuracy: {accuracy:.2f}")

        # Saving the model to a file
        os.makedirs("models", exist_ok=True)
        joblib.dump(model, "models/iris_model.joblib")

    except Exception as e:
        print(f"Error training or saving model: {e}")
        return
    print("Model trained and saved successfully.")

if __name__ == "__main__":
    model()
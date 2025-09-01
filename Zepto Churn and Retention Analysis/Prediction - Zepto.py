import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score
 
# Load dataset
df = pd.read_excel("churn_data.xlsx", sheet_name="Prediction")
 
# Features and Target
X = df[['Tenure_Months', 'TotalSpend', 'SupportTickets', 'GoldMember']]
y = df['Churn']
 
# Split data
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
 
# Train model
model = LogisticRegression(max_iter=2000)
model.fit(X_train, y_train)
 
# Predictions
y_pred = model.predict(X_test)
 
# Accuracy
print("Churn Prediction Accuracy:", accuracy_score(y_test, y_pred))
input("Press Enter to exit...")

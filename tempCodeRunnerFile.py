import pandas as pd
from sklearn.preprocessing import LabelEncoder
from sklearn.linear_model import LogisticRegression

# Dataset
data = pd.DataFrame([
["Male","Yes",5000,1,1],
["Female","No",3000,0,0],
["Male","Yes",6000,1,1],
["Female","No",2500,0,0]
], columns=["Gender","Married","Income","Credit_History","Loan_Status"])

# Encoding
le = LabelEncoder()
for col in ["Gender","Married"]:
    data[col] = le.fit_transform(data[col])

# Model Training
X = data.drop("Loan_Status", axis=1)
y = data["Loan_Status"]
model = LogisticRegression()
model.fit(X, y)

# Input
g = input("Gender (Male/Female): ")
m = input("Married (Yes/No): ")
i = float(input("Income: "))
c = int(input("Credit (1/0): "))

# Convert input
new = pd.DataFrame([[g, m, i, c]], columns=["Gender","Married","Income","Credit_History"])
for col in ["Gender","Married"]:
    new[col] = le.fit_transform(new[col])

# Prediction
pred = model.predict(new)

print("Approved " if pred[0]==1 else "Not Approved ")
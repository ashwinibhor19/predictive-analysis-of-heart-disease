## Solution Design

#### DATA :
The database was created by VA medical center in Cleveland and was obtained from UCI Machine
Learning repository. This database contains 76 attributes, but only 14 of them are mentioned
significant for the experimental purposes. The 13 being predictor variables with a combination of 5
numerical and 8 categorical variables and the last 1 as the target variable. The target variable refers
to the presence of heart disease in the patient.

#### DATA QUALITY :
We have found no missing values in the dataset. Most of the continuous variables presented a
normal distribution. There is no high correlation (>0.7) between the variables. The data thus is
observed to be clean.

#### PREDICTORS :
1. Age
2. Sex(male or female)
3. Chest pain type (1- typical angina, 2- atypical angina, 3- non-anginal pain, 4- asymptomatic)
4. Resting blood pressure(mmHg)
5. Serum cholesterol(mg/dl)
6. Fasting blood sugar(1- > 120mg/dl, 0- <120 mg/dl)
7. Maximum heart rate achieved and type
8. Exercise induced angina(chest pain)
9. ST depression induced by exercise
10. Number of major vessels

#### OUTCOME :
The outcome variable classifies the patient to have a heart disease or not ( 1 or 0)

#### VARIABLE SELECTION :
Using box plot and histograms, we obtained the outliers. Checked the dataset for missing values and
the normality for the continuous variables. We also generated the correlation matrix and scatter plot
to detect the correlation and multicollinearity between the variables.
Ashwini Bhor Abhay Kurian Group 14
We then created dummy variables for the categorical values and scaled the dataset.

#### APPROACH:
We plan on implementing KNN, Random Forest and Logistic Regression models for classifying whether the patient has heart disease or not.
We will split the data set into training and validation set. Apply the models to training and validation set. Create confusion matrix for the result and measure the accuracy of each of the model compared to the validation set target values.
For Logistic regression, we may have to apply PCA to the variables to reduce the number of features and check for multicollinearity as well.
The accuracy of each of the model will be compared, to decide which is the optimal model for classifying heart disease.

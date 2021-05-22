library(caret)
library(class)
library(gmodels)
library(fastDummies)
library(dplyr)
library(e1071)
library(Kmisc)
library(caTools)
library(rpart)
library(randomForest)
library(readxl)

dataset.orignal <- read.csv("heart.csv")
heart.df <- dataset.orignal
str(heart.df)
colnames(heart.df)[which(names(heart.df) == "ï..age")] <- "age"

#check missing values
sum(is.na(heart.df))

#create copies of dataset
heart2 <- heart.df
heart3<-heart.df
heart4<-heart.df

#encode categorical data
heart.df$sex <- factor(heart.df$sex, labels=c(0,1))
heart.df$cp <- factor(heart.df$cp,  labels = c("typical angina", "atypical angina", "non-anginal pain", "asympyomatic"))
heart.df$fbs <- factor(heart.df$fbs, labels=c(0,1))
heart.df$restecg <- factor(heart.df$restecg, labels = c("normal", "st abnormality", "hypertrophy"))
heart.df$exang <- factor(heart.df$exang, labels=c(0,1))
heart.df$slope <- factor(heart.df$slope, labels = c("Upslope", "Flat","Downslope"))
heart.df$thal <- factor(heart.df$thal, labels = c("No Thalassemia","Normal", "Fixed Defect","Reversible Defect"))
heart.df$target <- factor(heart.df$target, labels=c(0,1))

heart.log <- heart.df

#Filter(is.factor,heart.df)
heart.df <- dummy_cols(heart.df, select_columns = c("cp","restecg","slope","thal"),remove_first_dummy = FALSE)
str(heart.df)
heart.df<- select(heart.df ,-c("cp","restecg","slope","thal"))

normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x))) }

heart <- as.data.frame(lapply(heart.df, normalize))


str(heart)

set.seed(1111)
trainindex <- createDataPartition(heart$target, p=.6, list=FALSE, times = 1)

head(trainindex)
train <- heart[(trainindex),]
test<- heart[(-trainindex),]

sum(with(train, train$target ==1))
sum(with(train, train$target ==0))
sum(with(test, test$target ==1))
sum(with(test, test$target ==0))

histogram(train$target)
histogram(test$target)


heart.log <- scale(heart.log[])


X_train <- train[,-10]
X_test <- test[,-10]
train_label <- train[,10]
test_label <- test[,10]

#### Logistic
classifier <- glm(Purchased ~ ., family = binomial, data = training_set)
prob_pred <- predict(classifier, type = 'response', newdata = test_set[,-3])  
y_pred <- ifelse(prob_pred > 0.5, 1, 0)  
cm <- table(test_set[,3], y_pred)
cm
acc_logreg <- (sum(diag(cm))/sum(cm)) * 100.0
acc_logreg

#### Decision Tree
classifier <- rpart(Purchased ~ ., training_set)
y_pred <- predict(classifier, test_set[,-3], type = 'class')
cm <- table(test_set[,3], y_pred)
cm
acc_dt <- (sum(diag(cm))/sum(cm)) * 100.0
acc_dt


#### Random Forest
classifier <- randomForest(x= training_set[,-3], training_set[,3], ntree = 10)
y_pred <- predict(classifier, newdata = test_set[,-3])
cm <- table(test_set[,3], y_pred)
cm
acc_rf <- (sum(diag(cm))/sum(cm)) * 100.0
acc_rf





# churn_modeling.R

library(caret)
library(rpart)
library(randomForest)
library(e1071)

data <- read.csv("cleaned_telecom_data.csv")
data$Churn <- as.factor(data$Churn)

# Split the data
set.seed(123)
trainIndex <- createDataPartition(data$Churn, p = 0.7, list = FALSE)
train <- data[trainIndex, ]
test <- data[-trainIndex, ]

# Logistic Regression
log_model <- glm(Churn ~ ., data = train, family = binomial)
log_pred <- predict(log_model, test, type = "response")
log_pred_class <- ifelse(log_pred > 0.5, "1", "0")
log_results <- confusionMatrix(as.factor(log_pred_class), as.factor(test$Churn))

# Decision Tree
tree_model <- rpart(Churn ~ ., data = train, method = "class")
tree_pred <- predict(tree_model, test, type = "class")
tree_results <- confusionMatrix(tree_pred, test$Churn)

# Random Forest
rf_model <- randomForest(Churn ~ ., data = train, ntree = 100)
rf_pred <- predict(rf_model, test)
rf_results <- confusionMatrix(rf_pred, test$Churn)

# SVM
svm_model <- svm(Churn ~ ., data = train, kernel = "linear")
svm_pred <- predict(svm_model, test)
svm_results <- confusionMatrix(svm_pred, test$Churn)

# Output results
print("Logistic Regression Results")
print(log_results)
print("Decision Tree Results")
print(tree_results)
print("Random Forest Results")
print(rf_results)
print("SVM Results")
print(svm_results)

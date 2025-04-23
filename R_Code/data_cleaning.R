
# data_cleaning.R

# Load required libraries
library(dplyr)

# Load the dataset
data <- read.csv("Google form Responses.csv")

# Convert necessary columns to factor
data$Age <- as.factor(data$Age)
data$Gender <- as.factor(data$Gender)
data$Monthly.Income <- as.factor(data$Monthly.Income)
data$Location <- as.factor(data$Location)
data$Churn <- as.factor(ifelse(data$Churn == "Yes", 1, 0))

# Handle missing values
data <- na.omit(data)

# Save cleaned data
write.csv(data, "cleaned_telecom_data.csv", row.names = FALSE)


# data_visualization.R

library(ggplot2)

data <- read.csv("cleaned_telecom_data.csv")

# Age distribution
ggplot(data, aes(x = Age)) +
  geom_bar(fill = "skyblue") +
  labs(title = "Age Distribution", x = "Age Group", y = "Count")

# Gender distribution
ggplot(data, aes(x = Gender)) +
  geom_bar(fill = "salmon") +
  labs(title = "Gender Distribution", x = "Gender", y = "Count")

# Income distribution
ggplot(data, aes(x = Monthly.Income)) +
  geom_bar(fill = "lightgreen") +
  labs(title = "Income Distribution", x = "Income Level", y = "Count")

# Churn rate by Age Group
ggplot(data, aes(x = Age, fill = factor(Churn))) +
  geom_bar(position = "fill") +
  labs(title = "Churn Rate by Age Group", x = "Age", y = "Proportion")

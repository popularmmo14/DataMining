# Load required libraries
library(C50)
library(gmodels)

# Assuming your dataset is named 'data'
# Split the data into training and testing sets

dataset$DEATH_EVENT <- as.factor(dataset$DEATH_EVENT)

set.seed(123)
indexes <- sample(1:nrow(dataset), size = 0.8 * nrow(dataset))
train_data <- dataset[indexes, ]
test_data <- dataset[-indexes, ]

# Specify the formula for the model
formula <- DEATH_EVENT ~ .

# Train the C5.0 decision tree model
irTree <- C5.0(formula, data = train_data)

# Display a summary of the model
print(summary(irTree))

# Plot the decision tree graphically
plot(irTree, main = 'Decision Tree')

# Make predictions on the test dataset
death_event_pred <- predict(irTree, newdata = test_data)

# Evaluate the model
result <- CrossTable(test_data$DEATH_EVENT, death_event_pred, prop.chisq = FALSE,
                     prop.c = FALSE, prop.r = FALSE, dnn = c('Actual Class', 'Predicted Class'))

# Calculate and print the accuracy
accuracy <- sum(result$prop.table[, c('1', '0')])
print(paste("Accuracy:", accuracy))

#Load the dataset
dataset <- read.csv("dataset.csv")

#Load the necessary library
library(e1071)
#?naiveBayes

#summarize data
summary(dataset)

#Set a seed for reproducibility
set.seed(123)

#Split the data into training (70%) and testing (30%) sets
train_index <- sample(nrow(dataset), nrow(dataset) * 0.7)
train_data <- dataset[train_index, ]
test_data <- dataset[-train_index, ]

#Create the model
model <- naiveBayes(DEATH_EVENT ~ ., data = train_data)

#Predict the age group for the testing data
predictions <- predict(model, test_data)

#visualize the data
table(predictions, test_data$DEATH_EVENT)

#Evaluate the model
library(caret)
confusionMatrix(predictions, test_data$DEATH_EVENT)

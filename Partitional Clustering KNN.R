library(ggplot2)

dataset <- read.csv("dataset.csv")

normalize <- function(x) {
  return ((x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE)))
}

heart <- as.data.frame(lapply(dataset, function(x) if(is.numeric(x)) normalize(x) else x))

summary(dataset)

set.seed(123)

data <- dataset[, c("age","high_blood_pressure", "smoking","time")]

str(data)

k_2 <- kmeans(data, 2)

clus <- cbind(data, clus2 = k_2$cluster)

#Assuming clus is your data and k_3 is the result of k-means clustering
plot(clus$age, clus$time, col = k_2$cluster, pch = k_2$cluster,
     main = "age vs smoking", xlim = c(55, 100), ylim = c(5, 500),
     xlab = "age", ylab = "smoking")

plot(clus$time, clus$age, col = k_2$cluster, pch = k_2$cluster,
     main = "age vs time", xlim = c(5, 300), ylim = c(30, 100),
     xlab = "time", ylab = "age")


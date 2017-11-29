install.packages("arules")
library(arules)
data <- read.csv("data/association_data.csv", header=T)
head(data)
data <- as(data, "transactions")
data
inspect(data)

rules <- apriori(data, parameter = list(supp=0.0001))
summary(rules)
inspect(rules)
 

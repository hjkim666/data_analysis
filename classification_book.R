############################################################
# Classification 분류분석 
############################################################
install.packages("tree")
library(MASS)
library(tree)
data(iris)
iris
ir.tr = tree(Species ~., iris)
 
summary(ir.tr)
ir.tr
plot(ir.tr)
text(ir.tr, use.n=TRUE, all=TRUE, cex=.8)


iris


############################################################





















##############################################################
#install.packages("reshape") 
library(reshape)
#install.packages("Rcpp") 
library(Rcpp)


result <- read.csv("data\\my_classification.csv", header=FALSE)
#View(result) 
result <- rename(result, c(V1="total", V2="price", V3="period", V4="variety", V5="response"))
#View(result) 
set.seed(4321)
resultsplit <- sample(2, nrow(result), replace=TRUE, prob=c(0.7, 0.3))
train <- result[resultsplit==1,]
test <- result[resultsplit==2,]


install.packages("party")
library(party)
raw <- response ~ total + price + period + variety 
trainModel <- ctree(raw, data=train) 
table(predict(trainModel), train$response)
print(trainModel)
plot(trainModel)  
plot(trainModel, type="simple") 



testModel <- predict(trainModel, newdata=test) 
x <- table(testModel, test$response)
x
sum(diag(x))/sum(x)        



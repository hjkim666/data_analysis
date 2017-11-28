data1 <- read.csv("data/binary.csv")
data1
str(data1)
head(data1)

data1$rank <-as.factor(data1$rank)
str(data1)

model <- glm(admit ~ gre + gpa + rank, data =data1, family = "binomial")
summary(model)

newdata <- data.frame(gre=280, gpa=3.61, rank=as.factor(3)) 
predict(model, newdata, type="response")


accuracy <- table(floor(predict(model)>0.5), test$admit)
sum(diag(accuracy))/sum(accuracy)

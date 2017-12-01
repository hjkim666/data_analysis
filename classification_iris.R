# party ##############################################
#install.packages("party")
library(party)
data(iris)

set.seed(999)
######################################################
# sampling 
ind<-sample(2,nrow(iris),replace=T,prob=c(0.7,0.3)) 
traindata<-iris[ind==1,]
testdata<-iris[ind==2,]

train<-ctree(Species~.,data=traindata)

# prediction
testpred<-predict(train,newdata=testdata)

# accuracy
y<-table(testpred,testdata$Species)

# 정확도확인 방법1
sum(diag(x))/sum(x)  

# 정확도확인 방법2
prop.table(x)  

# 정확도 확인 방법3
#install.packages("caret")
library(caret)
confusionMatrix(x) 

#rpart ######################################################
#install.packages("rpart")
#install.packages("partykit")
library(rpart)
library(partykit)

trainmodel <- rpart(Species~., data=traindata) 
plot(trainmodel)
text(trainmodel)
trainmodel2 <- as.party(trainmodel) 
plot(trainmodel2)

x <- table(predict(trainmodel, newdata=testdata,type='class'), testdata$Species)
sum(diag(x))/sum(x)








####################################################################
# 비계층적 군집화  
#
# 사용 데이터 : wine
# class 분류: 1~3 /V1:Alcohol/V2:Malic acid/V3:Ash/
# V4:Alcalinity of ash/V5:Magnesium/V6:Total phenols/V7:Flavanoids/
# V8:Nonflavanoid phenols/V9:Proanthocyanins/V10:Color intensity/
# V11:Hue/V12:diluted wines/V13:Proline
####################################################################

## (1) k-means
install.packages("HDclassif")
library(HDclassif)
data(wine)
str(wine)

head(wine[,-c(1)])
head(wine[,-1])

(k_wine <- kmeans(wine[,-c(1)],3))

table(k_wine$cluster,wine$class)

plot(wine[,c("V1","V13")], col=k_wine$cluster)
points(k_wine$centers[,c("V1","V13")],col=1:3,pch=8)

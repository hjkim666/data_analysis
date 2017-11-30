####################################################################
# 텍스트 마이닝
# 자바 문제 해결 
# Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre7')
# library(rJava)
####################################################################
install.packages("KoNLP")
install.packages("RColorBrewer")
install.packages("wordcloud")

library(KoNLP)
library(RColorBrewer)
library(wordcloud)

useNIADic()
mergeUserDic(data.frame("빅데이터","ncn"))
mergeUserDic(data.frame("자격증", "ncn"))
mergeUserDic(data.frame("취업", "ncn"))

mytext <- file("data\\bigdata.txt", encoding="UTF-8")
myline <- readLines(mytext)
close(mytext)
head(myline, 5)
tail(myline, 5)

myword <- sapply(myline, extractNoun, USE.NAMES=F)
myword

result <- unlist(myword)
class(result)
head(result, 20)
result2 <- Filter(function(x){ nchar(x) >=2 }, result)
head(result2, 20)
result3 <- Filter(function(x){nchar(x) ==3}, result)
head(result3, 20)
result4 <- Filter(function(x){nchar(x) >=2 & nchar(x) <= 4},result)
head(result4, 20)

result2<- gsub("것","",result2)
result2<- gsub("저","",result2)
result2<- gsub("원","",result2)
result2<- gsub("지","",result2)

result2<- gsub("\\n","",result2)
result2<- gsub("\\d","",result2)
result2<- gsub("\\.","",result2)

head(result2, 20)

myword <- as.data.frame(result2)

## word cloud ################################### 
wordcount <- table(myword)
head(sort(wordcount, decreasing=T), 20)

palete <- brewer.pal(9, "Set1")
#palete <- brewer.pal(8, "Pastel2")

wordcloud(
  names(wordcount),
  freq=wordcount,
  scale=c(5,1),
  rot.per=0.5,
  min.freq=4,
  random.order=F,
  random.color=T,
  colors=palete
)

## pie chart ################################### 
a<-head(sort(wordcount, decreasing=T), 20)
pie(a, col=rainbow(10), radius=1)

pct<- round(a/sum(a)*100, 1)
names(a)
lab <- paste(names(a), "\n", pct, "%")
pie(a, mail="빅데이터 주요문의사항", col=rainbow(10), cex=0.8, lables=lab)

par(new=T)
pie(a, radius=0.6, col="white", lables=NA, border=NA)



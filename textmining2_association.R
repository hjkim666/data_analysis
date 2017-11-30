########################################################################
# Text mining _ association_analysis 
#
# 자바 관련오류 해결 
# Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre7')
# library(rJava)
########################################################################
install.packages("KoNLP")
install.packages("RColorBrewer")
install.packages("wordcloud")
install.packages("XLConnect")
install.packages(c("arules","igraph","combinat"))

library(KoNLP)
library(RColorBrewer)
library(XLConnect)
library(wordcloud)
library(combinat)
library(igraph)
library(arules)

f<-file("data\\bigdata.txt", encoding="UTF-8")
fl<-readLines(f)
close(f)
head(fl, 10)

fl<- gsub("것","",fl)
fl<- gsub("저","",fl)
fl<- gsub("원","",fl)
fl<- gsub("지","",fl)

fl<- gsub("\\n","",fl)
fl<- gsub("\\d","",fl)
fl<- gsub("\\.","",fl)

tran <- Map(extractNoun, fl)
tran <- unique(tran)
tran <- sapply(tran, unique)
tran <- sapply(tran, function(x){Filter(function(y)
{nchar(y) <= 4 && nchar(y) > 1 && is.hangul(y)}, x)})
tran <- Filter(function(x){length(x) >= 2}, tran)

names(tran) <- paste("Tr", 1:length(tran), sep="")
names(tran)

tran
wordtran <- as(tran, "transactions")
wordtran

wordtab <- crossTable(wordtran)
wordtab

# 연관분석 
ares <- apriori(wordtran, parameter=list(supp=0.07, conf=0.05))
inspect(ares)
#r0 <- ares [size(lhs(ares))!=0] 
#inspect(r0)

rules <- labels(ares, ruleSep=" ")
rules <- sapply(rules, strsplit, " ", USE.NAMES=F)
rulemat <- do.call("rbind", rules)

# 그래프 표현
ruleg <- graph.edgelist(rulemat[-c(1:11, 28:30),], directed=F)
plot.igraph(ruleg, vertex.label=V(ruleg)$name
            , vertex.label.cex=0.5, vertex.size=20
            , layout=layout.fruchterman.reingold.grid)

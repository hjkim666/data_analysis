########################################################################
# association rule analysis 
# data : Geoceries
########################################################################
install.packages("arules")
library(arules)

#EDA
data(Groceries)
head(Groceries)
str(Groceries)
table(Groceries@data@i)
table(Groceries@data@Dim)
head(Groceries@itemInfo)
summary(Groceries)
inspect(head(Groceries))

length(Groceries)
nrow(Groceries)
ncol(Groceries)
?Groceries
#####################################################################
r<- read.transactions("data/groceries.csv")
r

#####################################################################
#apriori function
G_arules<-apriori(Groceries, parameter=list(support=0.01, confidence=0.3))
summary(G_arules)
str(G_arules)
inspect(head(G_arules))
summary(G_arules@quality$lift)

#
(G_arules_yogurt <- subset(G_arules, subset = rhs %in% "yogurt" & lift > 2))
inspect(G_arules_yogurt)
inspect(G_arules_yogurt@lhs)
 
inspect(head(sort(G_arules_yogurt, by = "confidence"), n = 3))
inspect(head(sort(G_arules_yogurt, by = "support"), n = 3))

# visualization
install.packages("arulesViz")
library(arulesViz) 
plot(G_arules) 
plot(G_arules, method="grouped") 
plot(G_arules, method="graph", control=list(type="items")) 
plot(G_arules, method="graph", interactive=TRUE, control=list(type="items")) 






















groc<- read.transactions("data/groceries.csv",format="basket", sep=",")
groc

rules<-apriori(groc, parameter=list(support=0.01, confidence=0.3))
summary(rules)
gc()
str(rules)
inspect(head(rules))


library(arulesViz) 
plot(rules) 
plot(rules, method="grouped") 
plot(rules, method="graph", control=list(type="items")) 
plot(rules, method="graph", interactive=TRUE, control=list(type="items")) 


(G_arules_root_vegetables <- 
    subset(rules
           , subset = rhs %in% "root vegetables" & lift > 2))
inspect(G_arules_root_vegetables)













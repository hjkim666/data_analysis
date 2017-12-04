install.packages("readxl")
library(readxl)
install.packages("dplyr")
library(dplyr)
fish_1610<-read.csv("project/2016년10월.csv", stringsAsFactors=FALSE)
fish_1611<-read.csv("project/2016년11월.csv", stringsAsFactors=FALSE)
fish_1612<-read.csv("project/2016년12월.csv", stringsAsFactors=FALSE)
fish_1701<-read.csv("project/2017년01월.csv", stringsAsFactors=FALSE)

fish_1701$기준년월<- as.character(fish_1701$기준년월)  
fish_1610$당월.수출입중량<- as.integer(fish_1610$당월.수출입중량)
fish_1611$당월.수출입중량<- as.integer(fish_1611$당월.수출입중량)
fish_1612$당월.수출입중량<- as.integer(fish_1612$당월.수출입중량)

fish_all<-bind_rows(fish_1610,fish_1611,fish_1612,fish_1701)

fish_all 

#str(fish_1701)
#str(fish_1610)
#str(fish_1611)
#str(fish_1612)
#head(fish_1701)
#head(fish_1612)

 


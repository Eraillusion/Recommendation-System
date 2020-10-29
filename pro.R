library(ggplot2)
library(psych)
library(reshape2)
install.packages("factoextra")
library(factoextra)
library(recommenderlab)


setwd("C:\\Users\\Bolong\\Desktop")
data2<-read.csv('webLog.csv',sep=',',header=TRUE)
data2

data2 <-data2[which(data2$Staus < 399),]


ggplot(data2, aes(x = as.numeric(IP), y = as.numeric(URL))) + geom_point()

IP <- as.numeric(data2[,1]) 
URL <- as.numeric(data2[,3])
ip <- data2[,1]
url <- data2[,3]
dbscan <- data.frame(URL,IP)
dc <- data.frame(IP,URL)
dc2 <- data.frame(IP,URL)

dc3 <- as.data.frame(table(dc2[,1]))


trans <- as(dc, "transactions")
trans.apriori <- apriori(trans, parameter = list(support = 0.01, confidence = 0.5, maxlen = 2)) 
inspect(trans.apriori)


set.seed(123)
km.res <- kmeans(dc, 10, nstart = 25)
fviz_cluster(km.res, dc, frame = FALSE, geom = "point")


dk <- fpc::dbscan(dbscan, eps = 1.5, MinPts = 5)
# Plot DBSCAN results
plot(dk, dbscan, main = "DBSCAN", frame = FALSE)
print(dk)


do <- as.data.frame(table(dc2))
do[order(-do$Freq),]
do <- do[order(-do$Freq),]
do$Freq <- do$Freq
do_top <- do[order(-do$Freq),][1:200,]

wordcloud2(do, size = 1,shape = 'star')  

plot(do_top$URL, do_top$Freq)

ggplot(do_top,x=do_top$Freq,aes(x=factor(1),fill=factor(do_top$Freq)))+geom_bar(width = 1)+
coord_polar(theta="y")+ggtitle("Preference Plot")+
labs(x="",y="")+
guides(fill=guide_legend(title = 'Preference'))

ggplot(dc3,aes(x=factor(1), fill=factor(dc3$Freq)))+geom_bar(width = 1)+
  coord_polar(theta="y")+ggtitle("Preference Plot")+
  labs(x="",y="")+
  guides(fill=guide_legend(title = 'Preference'))


cast_do_top <- dcast(do_top,do_top$IP~do_top$URL,value="do_top$Freq")


class(cast_do_top)<-"data.frame"

cast_do_top<-as.matrix(cast_do_top)
cast_do_top<-as(cast_do_top,"realRatingMatrix")
cast_do_top

rec <- Recommender(cast_do_top, method = "UBCF")
pre <- predict(rec, cast_do_top[1:2], n = 3)
pre
as(pre, "list")


pre2 <-predict(rec,cast_do_top[1:3],type="ratings")
as(pre2,"matrix")[1:3,1:44]


cast_do_top_n <- normalize ( cast_do_top )
image ( cast_do_top_n , main = "normalized" )
image(cast_do_top)

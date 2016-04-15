file = read.csv("/Users/jemoore/Desktop/test data files/page_num.csv")

library(foreach)

mydata=as.data.frame(table(file))

pages = mydata$file
count = mydata$Freq

names(count)=pages

#barplot(count, main="TITLE",xlab="page num", ylab="# of clicks")

a=c(1,2,3)
b = foreach(i=a, .combine='c') %do% {
	 i*2
}
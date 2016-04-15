mydata = read.csv("/Users/jemoore/Desktop/test data files/test.csv")    
b = mydata$total_seen  
a= mydata$date
names(b)=a
mean = mean(b)
sdev = sd(b)
barplot(b, main="TITLE",xlab="date", ylab="total seen")
abline(h=mean, col="black")
abline(h=mean+sdev, col="red")
abline(h=mean-sdev,col="blue")
#print(b)
#print(mydata)
#plot(a,b)
colors=c("red","black","blue")
legend("topright", inset=0, title="Legend",c("sd+mean","mean","mean-sd"),fill=colors)


#correlation
#plot(x,y)
#cor.test(x,y)
#check p-value is < 0.05
#line = lm(y ~ x)
#abline(line)





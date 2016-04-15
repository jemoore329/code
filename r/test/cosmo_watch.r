mydata = read.csv("/Users/jemoore/Desktop/cosmo_watch.csv")

watch = mydata$watchbuttonclicked
add = mydata$watchbuttonadd



plot(watch,add, xlim=c(0,30))

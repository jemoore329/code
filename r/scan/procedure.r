#import csv file
mydata = read.csv("/Users/jemoore/Desktop/allyou-nov-pagelevel.csv")

#sum a column from data frame
total_button_active = sum(mydata$buttonactive)

#get rid of rows with NA
newdata = na.omit(mydata)


#get a subset of data
dfa = subset(newdata, class == 1)

#drop columns from data frame
drops = c("date", "class", "buttonactive")
dfa2 = dfa[,!(names(dfa) %in% drops)]

#sum all columns in data frame
lapply(dfa2,sum)

#get a unique vector of sorted pages
page_array_a = sort(unique(dfa2$pagenum))

#run foreach loop over pages array, create subset and print column totals
library(foreach)

pall = foreach(i=page_array_a, .combine='cbind') %do% {
  lapply(subset(dfa2,pagenum == i), sum)
  
  }
  
print(pall)




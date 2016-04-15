mydata = read.csv("/Users/jemoore/Desktop/all you/allyou-nov-pagelevel.csv")


total_button_active = sum(mydata$buttonactive)

#get rid of rows with NA
newdata = na.omit(mydata)

#intialize seperate data frames for scans and tablet
a=newdata[1,]
b=newdata[1,]
dfa = data.frame(a) #scans
dfb = data.frame(b) #tablet
acount = 1;
bcount = 1;

#loop and sort by class
for(i in 1:nrow(newdata)) {
	
	 if( newdata[i,"class"] == 1 ) {
		#{print(newdata[i,]) }
		newa = newdata[i,]
		dfa[acount,] = newa
		acount=acount+1  }
		
		
	if( newdata[i,"class"] == 2 ) {
	 newb = newdata[i,]	
	 dfb[bcount,] = newb
	 bcount=bcount+1 }
	
	}
	
	
#create total sums for each column, and report totals for each data frame
total_opens_tablet = sum(dfb$opens)
total_opens_scan = sum(dfa$opens)

total_watch_tab = sum(dfb$watchbuttonclicked)
total_watch_scan = sum(dfa$watchbuttonclicked)

total_prod_open_tab = sum(dfb$productopened)
total_prod_open_scan = sum(dfa$productopened)


total_prod_clik_tab = sum(dfb$productclicked)
total_prod_clik_scan = sum(dfa$productclicked)

total_deal_clik_tab = sum(dfb$dealclicked)
total_deal_clik_scan = sum(dfa$dealclicked)

eng_per = (total_opens_tablet/total_button_active)*100

 message("total opens for tablet:", total_opens_tablet)
 message("total opens for scan:", total_opens_scan)
 
 message("\n total watched for tablet:", total_watch_tab)
 message("total watched for scan:", total_watch_scan)
 
 message("\n total prod opened for tablet:", total_prod_open_tab)
 message(" total prod opened for scan:", total_prod_open_scan)
 
 message("\n total prod clicked for tablet:", total_prod_clik_tab)
 message(" total prod clicked for scan:", total_prod_clik_scan)

 message("\n total deal clicked for tablet:", total_deal_clik_tab)
 message(" total deal clicked for scan:", total_deal_clik_scan)

 message("\n total button active:", total_button_active)
 
 message("\n engagement % :", eng_per)
 
 #get page-level stats for dfa (scans)
 
 #frequency per page
 dfapages = as.data.frame(table(dfa$pagenum))
 colnames(dfapages)[1] = "page"
 print(dfapages)
 
 page_array = sort(unique(dfa$pagenum))
 #drop date column
 drops = c("date", "class")
 dfa2 = dfa[,!(names(dfa) %in% drops)]
 

#create subsets for each page
p18 = subset(dfa2, pagenum == 18)
p21 = subset(dfa2, pagenum == 21)
p23 = subset(dfa2, pagenum == 23)
p25 = subset(dfa2, pagenum == 25)
p28 = subset(dfa2, pagenum == 28)
p94 = subset(dfa2, pagenum == 94)
p99 = subset(dfa2, pagenum == 99)

print(lapply(p18,sum))
lapply(p21,sum)
lapply(p23,sum)
lapply(p25,sum)
lapply(p28,sum)
lapply(p94,sum)
lapply(p99,sum)




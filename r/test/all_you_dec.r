mydata = read.csv("/Users/jemoore/Desktop/all_you_dec_total_data.csv")

mytime = read.csv("/Users/jemoore/Desktop/avgtime_all_you_dec.csv")
timedata_a = subset(mytime, class == 1)
timedata_b = subset(mytime, class == 2)
 
 time_sum_a = sum(timedata_a$avg_time)
 time_sum_b = sum(timedata_b$avg_time)
 
 avg_time_a = time_sum_a/length(timedata_a$avg_time)
 avg_time_b = time_sum_b/length(timedata_b$avg_time)
 
 
 mytime_nov = read.csv("/Users/jemoore/Desktop/avgtime_all_you_nov.csv")
nov_timedata_a = subset(mytime_nov, class == 1)
nov_timedata_b = subset(mytime_nov, class == 2)
 
 nov_time_sum_a = sum(nov_timedata_a$avg_time)
 nov_time_sum_b = sum(nov_timedata_b$avg_time)
 
 nov_avg_time_a = nov_time_sum_a/length(nov_timedata_a$avg_time)
 nov_avg_time_b = nov_time_sum_b/length(nov_timedata_b$avg_time)
 
 
total_button_active = sum(mydata$buttonactive)

#get rid of rows with NA
newdata = na.omit(mydata)

#scans
dfa = subset(newdata, class == 1)

#tablet
dfb = subset(newdata, class == 2)

drops = c("date", "class", "buttonactive")
dfa2 = dfa[,!(names(dfa) %in% drops)]
dfb2 = dfb[,!(names(dfa) %in% drops)]
lapply(dfa2,sum)
lapply(dfb2,sum)


page_array_a = sort(unique(dfa2$pagenum))
page_array_b = sort(unique(dfb2$pagenum))


library(foreach)

pall = foreach(i=page_array_a, .combine='cbind') %do% {
	lapply(subset(dfa2,pagenum == i), sum)
	}
#transpose data frame
pall= t(pall)	
#print(pall)

if(FALSE){
p5 = subset(dfa2, pagenum == 5)
p13 = subset(dfa2, pagenum == 13)
p14 = subset(dfa2, pagenum == 14)
p18 = subset(dfa2, pagenum == 18)
p21 = subset(dfa2, pagenum == 21)
p23 = subset(dfa2, pagenum == 23)
p25 = subset(dfa2, pagenum == 25)
p27 = subset(dfa2, pagenum == 27)
p29 = subset(dfa2, pagenum == 29)
p32 = subset(dfa2, pagenum == 32)
p34 = subset(dfa2, pagenum == 34)
p35 = subset(dfa2, pagenum == 35)
p37 = subset(dfa2, pagenum == 37)
p39 = subset(dfa2, pagenum == 39)
p92 = subset(dfa2, pagenum == 92)
p100 = subset(dfa2, pagenum == 100)
p111 = subset(dfa2, pagenum == 111)
p115 = subset(dfa2, pagenum == 115)
p127 = subset(dfa2, pagenum == 127)
p130 = subset(dfa2, pagenum == 130)

lapply(p5,sum)

p1 = subset(dfb2, pagenum == 1)
p3 = subset(dfb2, pagenum == 3)
p5 = subset(dfb2, pagenum == 5)
p6 = subset(dfb2, pagenum == 6)
p8 = subset(dfb2, pagenum == 8)
p9 = subset(dfb2, pagenum == 9)
p10 = subset(dfb2, pagenum == 10)
p11 = subset(dfb2, pagenum == 11)
p12 = subset(dfb2, pagenum == 12)
p13 = subset(dfb2, pagenum == 13)
p14 = subset(dfb2, pagenum == 14)
p16 = subset(dfb2, pagenum == 16)
p17 = subset(dfb2, pagenum == 17)
p18 = subset(dfb2, pagenum == 18)
p19 = subset(dfb2, pagenum == 19)
p20 = subset(dfb2, pagenum == 20)
p21 = subset(dfb2, pagenum == 21)
p23 = subset(dfb2, pagenum == 23)
p25 = subset(dfb2, pagenum == 25)
p27 = subset(dfb2, pagenum == 27)
p29 = subset(dfb2, pagenum == 29)
p32 = subset(dfb2, pagenum == 32)
p33 = subset(dfb2, pagenum == 33)
p34 = subset(dfb2, pagenum == 34)
p35 = subset(dfb2, pagenum == 35)
p36 = subset(dfb2, pagenum == 36)
p37 = subset(dfb2, pagenum == 37)
p39 = subset(dfb2, pagenum == 39)
p43 = subset(dfb2, pagenum == 43)
p44 = subset(dfb2, pagenum == 44)
p45 = subset(dfb2, pagenum == 45)
p51 = subset(dfb2, pagenum == 51)
p52 = subset(dfb2, pagenum == 52)
p57 = subset(dfb2, pagenum == 57)
p58 = subset(dfb2, pagenum == 58)
p63 = subset(dfb2, pagenum == 63)
p65 = subset(dfb2, pagenum == 65)
p67 = subset(dfb2, pagenum == 67)
p69 = subset(dfb2, pagenum == 69)
p72 = subset(dfb2, pagenum == 72)
p76 = subset(dfb2, pagenum == 76)
p79 = subset(dfb2, pagenum == 79)
p80 = subset(dfb2, pagenum == 80)
p89 = subset(dfb2, pagenum == 89)
p92 = subset(dfb2, pagenum == 92)
p98 = subset(dfb2, pagenum == 98)
p99 = subset(dfb2, pagenum == 99)
p100 = subset(dfb2, pagenum == 100)
p106 = subset(dfb2, pagenum == 106)
p111 = subset(dfb2, pagenum == 111)
p114 = subset(dfb2, pagenum == 114)
p115 = subset(dfb2, pagenum == 115)
p120 = subset(dfb2, pagenum == 120)
p121 = subset(dfb2, pagenum == 121)
p124 = subset(dfb2, pagenum == 124)
p125 = subset(dfb2, pagenum == 125)
p126 = subset(dfb2, pagenum == 126)
p127 = subset(dfb2, pagenum == 127)
p130 = subset(dfb2, pagenum == 130)
p132 = subset(dfb2, pagenum == 132)
p134 = subset(dfb2, pagenum == 134)
p142 = subset(dfb2, pagenum == 142)
p143 = subset(dfb2, pagenum == 143)
p145 = subset(dfb2, pagenum == 145)
p146 = subset(dfb2, pagenum == 146)
p147 = subset(dfb2, pagenum == 147)


lapply(p1,sum)
}




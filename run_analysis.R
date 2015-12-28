library(sqldf)
library(dplyr)

###Read features
setwd("c:/users/chk713/Documents/Coursera/UCI/")
features <-read.table("features.txt")

###Read training file
setwd("c:/users/chk713/Documents/Coursera/UCI/train/")
subject_train <- read.table("subject_train.txt")
y_train <- read.table("y_train.txt")
x_train <- read.table("X_train.txt")
colnames(x_train) <-features[,2]

###Read test file
setwd("c:/users/chk713/Documents/Coursera/UCI/test/")
subject_test <- read.table("subject_test.txt")
y_test <- read.table("y_test.txt")
x_test <- read.table("X_test.txt")
colnames(x_test) <-features[,2]

###Combind all rows (train and test data)
comb1<-rbind2(subject_train,subject_test)
colnames(comb1)<-"Subject"
comb2<-rbind2(y_train,y_test)
colnames(comb2)<-"Activity"
comb3<-rbind2(x_train,x_test)

###Combind all columns
comb_temp<-cbind2(comb1,comb2)
comb_all<-cbind2(comb_temp,comb3) #Final#
rm(list= ls()[!(ls() %in% c('comb_all'))])


################################################################
################################################################
#   Completed #1, #4
################################################################
################################################################

comb_all<-comb_all[,c(1:8,43:48,83:88,123:128,163:168,203:204,216:217,
            229:230,242:243,255:256)]
#sapply(comb_all,class)
comb_all<-transform(comb_all,Activity=as.character(Activity))

################################################################
################################################################
#   Completed #2
################################################################
################################################################

#Applying activity names
setwd("c:/users/chk713/Documents/Coursera/UCI/")
activity_labels <-read.table("activity_labels.txt")
samples<-activity_labels[,1]
activity_labels<-activity_labels[,2]
activity_labels<-as.character(activity_labels)
tryCatch({
  comb_all[comb_all$Activity == 1,]$Activity= activity_labels[1]
}, error=function(e){})
tryCatch({
  comb_all[comb_all$Activity == 2,]$Activity= activity_labels[2]
}, error=function(e){})
tryCatch({
  comb_all[comb_all$Activity == 3,]$Activity= activity_labels[3]
}, error=function(e){})
tryCatch({
  comb_all[comb_all$Activity == 4,]$Activity= activity_labels[4]
}, error=function(e){})
tryCatch({
  comb_all[comb_all$Activity == 5,]$Activity= activity_labels[5]
}, error=function(e){})
tryCatch({
  comb_all[comb_all$Activity == 6,]$Activity= activity_labels[6]
}, error=function(e){})
rm(list= ls()[!(ls() %in% c('comb_all'))])
   
################################################################
################################################################
#   Completed #3
################################################################
################################################################

#?


################################################################
################################################################
#   Completed #5
################################################################
################################################################

write.table(comb_all, file="result.txt", row.name=FALSE)





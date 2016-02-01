# GACD Project script file - run_analysis.R
# Load dplyr library
library(dplyr)
#library(tidyr)
# Read all the text files to analysis its content

act_label<-read.table("activity_labels.txt") # Read activity lables
train_datx<-read.table("./train/X_train.txt") # Read train data and subject id
train_daty<-read.table("./train/y_train.txt")
test_datx<-read.table("./test/X_test.txt") # Read test data and subject id
test_daty<-read.table("./test/y_test.txt")
col_nam<- read.table("features.txt") # read column names
subj_test<-read.table("./test/subject_test.txt")
subj_train<-read.table("./train/subject_train.txt")
# Assign column names for subject id and activity id
colnames(subj_test) <- c("subject.id")
colnames(subj_train) <-c("subject.id")
colnames(test_daty) <-c("activity.id")
colnames(train_daty)<-c("activity.id")
# cbind these with data

test_datx<-cbind(subj_test,test_daty,test_datx) # cbind subj of test
train_datx<-cbind(subj_train,train_daty,train_datx) # cbind subj of train
total_dataset<-rbind(test_datx,train_datx) # merge test_dat and train dat to get 10299 obs by 563 variables
# Select variable that have std() and mean() in their colnames
ms_mean<-grep("-mean()", col_nam$V2) # mean 46 
ms_std<-grep("-std()", col_nam$V2) # std 33
# select std , mean columns from the total data set

dat_sel_std<-select(total_dataset,num_range("V",ms_std))
dat_sel_mean<-select(total_dataset,num_range("V",ms_mean))
dat_sel_id<-select(total_dataset,1:2)
da_se_std<-dat_sel_std   # duplicate the std and mean data for intermediate operations
da_se_mean<-dat_sel_mean
# Phrase the col. headings for std data
std_col_nam<-col_nam[,2]
std_cols<-std_col_nam[ms_std]
std_cols1<-gsub(".std\\()",".std",std_cols)
std_colst<-gsub("^t","Time",std_cols1)
std_colsf<-gsub("^f","Frequency",std_colst)
std_colsf1<-gsub("-",".",std_colsf)
colnames(da_se_std)<-std_colsf1 # prepare std dataset
# Phrase the col. headings for mean data
mean_col_nam<-col_nam[,2]
mean_cols<-mean_col_nam[ms_mean]
mean_cols1<-gsub(".mean\\()",".mean",mean_cols)
mean_colst<-gsub("^t","Time",mean_cols1)
mean_colsf<-gsub("^f","Frequency",mean_colst)
mean_colsf1<-gsub("-",".",mean_colsf)
mean_colsf2<-gsub(".meanFreq\\()",".meanFreq",mean_colsf1)
colnames(da_se_mean)<-mean_colsf2
# cbind for final extracted dataset
dat_sel_f1<-cbind(dat_sel_id,da_se_std,da_se_mean) # dim of 10299 by 81
# create the final , labelled summary data set
data_sum<- dat_sel_f1 %>% group_by(subject.id,activity.id) %>% summarise_each(funs(mean)) # final summary data 180*81
write.table(data_sum,file="harus.txt",row.names=FALSE) 
# write to harus.txt - Human Activity Recognition Using Smartphones (30*6)*79
# Activity id to be repleaced with activity name...
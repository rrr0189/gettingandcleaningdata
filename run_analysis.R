# Thank you for your time!
# Below are 6 succinct steps to viewing the 2 tidy data sets.

# (1/6) Place run_analysis.R in the same directory as the UCI HAR
#       Dataset folder. The build of this script depends on the
#       UCI Har Dataset folder being as-is.
#       (i.e. in the same state as when you initially downloaded
#       & unzipped the data when you were working on your project)

#       Confirm that the UCI Har Dataset folder is in your current wd:

getwd(); dir()

# (2/6) After confirming your directory, run these libraries:

library(data.table);library(dplyr); library(tidyr)

# (3/6) Now run these 2 lines of code:

testFilePath <- "UCI Har Dataset/test/"
trainFilePath <- "UCI Har Dataset/train/"

#########################################################
# (4/6) IMPORTANT: Define the two functions tidydataDF1() 
#       & tidydataDF2() at the very bottom.
#########################################################

# (5/6) Run these 2 lines of code to view the 1st tidy data set 
#       (from problem statement 4):

DF <- tidydataDF1()
View(DF)

# (6/6) Run these 2 lines of code to view the 2nd tidy data set
#       (from problem statement 5).

DFaverages <- tidydataDF2(DF)
View(DFaverages)

tidydataDF1 <- function(x) {      
      # Here are the 561-dimensional Feature vectors for Train and Test;
      # We bind these Feature vectors together, row-wise.
      
      xtest <- fread(paste0(testFilePath, "X_test.txt"))
      xtrain <- fread(paste0(trainFilePath, "X_train.txt"))
      X <-rbind(xtrain, xtest)
      
      # Here are the subject vectors (x2), corresponding to the
      # test and train observations, respectively.
      # This is a row-wise bind, corresponding to the order
      # of the train and test bind above.
      
      subjectsTest <- fread(paste0(testFilePath,"subject_test.txt"))
      subjectsTrain <- fread(paste0(trainFilePath, "subject_train.txt"))
      subjects <- rbind(subjectsTrain, subjectsTest)
      
      # Here are the activity vectors (x2), where each
      # entry corresponds to the activity that each subject
      # was partaking in for a particular measurement.
      # We use a row-wise bind as well.
      
      ytest <- fread(paste0(testFilePath, "Y_test.txt"))
      ytrain <- fread(paste0(trainFilePath, "Y_train.txt"))
      Y <- rbind(ytrain, ytest)
      Y$V1 <- as.factor(Y$V1)
      
      # Here are the activity labels to replace the integers in
      # Y. 
      lab <- fread("UCI Har Dataset/activity_labels.txt")$V2
      Y$V1 <- recode_factor(Y$V1, `1` = lab[1], `2` = lab[2],
                            `3` = lab[3], `4` = lab[4],
                            `5` = lab[5], `6` = lab[6])
      
      # Dimensions of xtest and xtrain confirm 561-Feature vectors.
      # Set the variable names using the features.txt file, which
      # contains 561 lines (variables), as expected.
      
      # Retrieve the indices of those variables that have to do with
      # the mean and standard deviation of measurements.
      # Then, perform the following changes in sequential order:
      #(1) remove all non-alphanumeric characters.
      #(2) change 't' to 'time' when variable name starts with 't'.
      #(3) change 'f' to 'freq' when variable name starts with 'f'.
      #(4) change 'mean' to 'Mean'
      #(5) change 'std' to 'Std'
      #(6) change "BodyBody" to "Body"
      #(7) change "Acc" to "Accel"
      
      features <- fread("UCI Har Dataset/features.txt",
                        drop = "V1",
                        col.names = "variables")
      
      colIndices <- grep("[Mm]ean\\(\\)|[Ss]td\\(\\)", features$variables)
      features <- features[colIndices]
      
      
      variables <- gsub("[^[:alnum:]]", "", features$variables) #(1)
      variables <- gsub("^t", "time", variables) #(2)
      variables <- gsub("^(f)", "freq", variables) #(3)
      variables <- gsub("mean", "Mean", variables) #(4)
      variables <- gsub("std", "Std", variables) #(5)
      variables <- gsub("BodyBody", "Body", variables) #(6)
      variables <- gsub("Acc", "Accel", variables) #(7)
      
      # Use the column indices obtained above to narrow the feature 
      # data table. Then, assign the names.
      
      X <- X[,..colIndices]
      names(X) <- variables
      names(Y) <- "activity"
      names(subjects) <- "subject"
      
      # Change the 
      
      # Combine X, Y, and subjects into one data frame.
      DF1 <- cbind(subjects, Y, X)
      
      DF1
}

tidydataDF2 <- function(DF1) {
      DF2 <- DF1 %>% 
                group_by(subject, activity) %>%
                summarize_at(names(DF1)[3:length(names(DF1))], mean)
      DF2
}

#########################################################
# If you would like copies of these DataSets on your hard
# drive:
file.create(c("tidyDataSet1.csv", "tidyDataSet2.csv"))
write.table(DF, "tidyDataSet1.csv", row.names = FALSE)
write.table(DFaverages, "tidyDataSet2.csv", row.names = FALSE)

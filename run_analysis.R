
#Unions the two data sets together
A <- rbind(x_train, x_test)

#Unions the two data sets together
B <- rbind(y_train, y_test)

#Unions the two data sets together
Subject <- rbind(subject_train, subject_test)

#cbind appends the two data sets together; adds more columns
#Creates one large dataset
Combined_Data <- cbind(Subject, Y, X)

#Within the merged dataset, brings back all columns where std and mean are included in the name
Tdata <- Combined_Data %>% select(subject, code, contains("mean"), contains("std"))

#Within the Tidy dataset, subsetting to get the activity name
Tdata$code <- activities[TidyData$code, 2]

Tdata$code

Tdata


#This labels the TData with descriptive variable names
names(Tdata)
  names(Tdata)[2] = "activity"
  names(Tdata)<-gsub("Acc", "Accelerometer", names(Tdata))
  names(Tdata)<-gsub("Gyro", "Gyroscope", names(Tdata))
  names(Tdata)<-gsub("BodyBody", "Body", names(Tdata))
  names(Tdata)<-gsub("Mag", "Magnitude", names(Tdata))
  names(Tdata)<-gsub("^t", "Time", names(Tdata))
  names(Tdata)<-gsub("^f", "Frequency", names(Tdata))
  names(Tdata)<-gsub("tBody", "TimeBody", names(Tdata))
  names(Tdata)<-gsub("-mean()", "Mean", names(Tdata), ignore.case = TRUE)
  names(Tdata)<-gsub("-std()", "STD", names(Tdata), ignore.case = TRUE)
  names(Tdata)<-gsub("-freq()", "Frequency", names(Tdata), ignore.case = TRUE)
  names(Tdata)<-gsub("angle", "Angle", names(Tdata))
  names(Tdata)<-gsub("gravity", "Gravity", names(Tdata))


#creates a second, independent tidy data set with the average of each variable for each activity and each subject.
AnalysisData <- Tdata %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(AnalysisData, "AnalysisData.txt", row.name=FALSE)

file.path(AnalysisData.txt)

merged_test <- cbind(Sub_test,Y_test,X_test)
merged_train <- cbind(Sub_train,Y_train,X_train)
merged_data <- rbind(merged_test,merged_train)

mean_std_num <- grep("mean()|std()",names$V2)
mean_std_num <- sapply(mean_std_num, function(x){x+2})
mean_std_num <- c(1,2,mean_std_num)

selected_data <- merged_data[,mean_std_names]

selected_data$V1.1 <- activity_labels[ match(selected_data$V1.1, activity_labels$V1) , 'V2']

mean_std_names <- grep("mean()|std()",names$V2,value = TRUE)

mean_std_names <- sub("f","freq",mean_std_names)
mean_std_names <- sub("t","time",mean_std_names)
mean_std_names <- c("subject_id","activity_name",mean_std_names)
colnames(selected_data) <- mean_std_names

final_data <- final_data %>% summarise_all(funs(mean))
analysis <- function(directory) {
    ## measurements names
    features <- read.csv(paste(directory, "features.txt", sep="/"),
                         header=FALSE, sep="", as.is=T)$V2
    feature_filter <- 1:length(features) %in% grep("mean\\(|std\\(", features)
    
    ## read training data
    x <- read.csv(paste(directory, "train", "X_train.txt", sep="/"),
                  header=FALSE, sep="", col.names=features)    
    x <- subset(x, select=feature_filter) # filter out unneccessary measurements
    
    y <- read.csv(paste(directory, "train", "y_train.txt", sep="/"),
                  header=FALSE, sep="", col.names="activity")
    
    subject <- read.csv(paste(directory, "train", "subject_train.txt", sep="/"),
                        header=FALSE, sep="", col.names="subject")
    
    train <- cbind(subject, y, x)
    
    ## read test data
    x <- read.csv(paste(directory, "test", "X_test.txt", sep="/"),
                  header=FALSE, sep="", col.names=features)
    x <- subset(x, select=feature_filter) # filter out unneccessary measurements
    
    y <- read.csv(paste(directory, "test", "y_test.txt", sep="/"),
                  header=FALSE, sep="", col.names="activity")
    
    subject <- read.csv(paste(directory, "test", "subject_test.txt",
                              sep="/"), header=FALSE, sep="", col.names="subject")
    
    test <- cbind(subject, y, x)
    
    ## merge training data and test data
    data <- rbind(train, test)
    
    
    ## set activity labels
    activity_labels <- read.csv(paste(directory, "activity_labels.txt", sep="/"), header=FALSE, sep="")$V2
    data$activity <- sapply(data$activity, function(x) activity_labels[x])
    
    ## create new data set : mean value of each measurement, for each activity and each subject
    ddply(data, .(subject, activity), colwise(mean))
}


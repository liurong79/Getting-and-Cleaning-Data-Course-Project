A tidy data transformed from "Human Activity Recognition Using Smartphones Dataset". 
For more detail about this dataset, please refer to:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


Variables:
subject : Subject who performed the experiment.
activity : Activity the subject took.
tBodyAcc.mean...X : Mean value of measurement tBodyAcc.mean()-X for specific subject and activity.
tBodyAcc.std...X : Mean value of measurement tBodyAcc.std()-X for specific subject and activity.
*following 64 variables take the same format.

Steps taken to generate tidy data:
1. Merged the training and the test sets.
2. Extracted only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Labeld variable names.
5. Aggregated by each subject and activity and then calculate the average of each variable.

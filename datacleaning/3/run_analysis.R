options(stringsAsFactors=FALSE) # we want numeric values as such
library("reshape") # allows recast--equivalent to melt and dcast
features = read.csv("Dataset/features.txt", sep=" ", header=FALSE) # loading the descriptive field names
train = read.csv("Dataset/train/X_train.txt", sep=" ", header=FALSE) # training set
test = read.csv("Dataset/test/X_test.txt", sep=" ", header=FALSE) # test set
all = rbind(train, test) # union of observations of both datasets
colnames(all) = features[,2] # assigning descriptive names from first file
allmeansstds = all[,c(grep("mean|std", colnames(all)))] # retain only means and standard deviations
trainsubjects = read.csv("Dataset/train/subject_train.txt", header=FALSE) # load training subjects
testsubjects = read.csv("Dataset/test/subject_test.txt", header=FALSE) # load test subjects
allsubjects = rbind(trainsubjects, testsubjects) # union of subjects
data <- cbind(allmeansstds, allsubjects) # bind them to the dataset
colnames(data)[ncol(data)] = "subject" # naming the subject column
final <- recast(data, subject ~ variable, id.var=ncol(data), mean) # melt and recast to get mean per subject for each variable
write.table(final, file="finaltidysummary.txt", row.name=FALSE) # write output

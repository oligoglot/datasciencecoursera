# download data
wget https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
unzip getdata_projectfiles_UCI\ HAR\ Dataset.zip
mv UCI\ HAR\ Dataset/ Dataset
# remove leading and trailing whitespaces and replace a string of spaces with one
perl -i -ne 's/^\s*//; s/\s+/ /g; s/\s$//; print "$_\n";' Dataset/t*/X_*.txt

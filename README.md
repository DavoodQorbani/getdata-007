READ ME
========================================================

**Note 1:** If you previuosly downloded the data set, just create 'jtleek' folder in your working directory and put a copy of the data set in it. I mean the ZIP file itself; its name should be

```{r}
getdata_projectfiles_UCI HAR Dataset.zip
```

How my R script works!
-------------------------
Download 'run_analysis.R' file and put it in your R working directory. Then run the following code in your R console:
```{r}
source("run_analysis.R")
```

**Note 2:** This script checks the existence of 'jtleek' folder and the data set before creating the mentioned folder and downloading the file.

This R script creates **jtleek** folder in your working directoty.  
_**Trivia:**_ I chose 'jtleek' to show my respect for the instructor of this course =)  

Then it downloads a data set from
```{r}
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
```
 

This script unzips the data set and after performing the codes, it creates a tidy data set (please refer to CodeBook.md) and puts it in 'jtleek' folder of your working directory.  

Finally, it performs a little housekeeping and deletes the folder of unzipped data set. But It keeps the ZIP file itself.


Required libraries / Packages
-------------------------
reshape2  
plyr

-------------------------
License:
------------------------- 
Davood Qorbani (www.qorbani.info), SEP 2014
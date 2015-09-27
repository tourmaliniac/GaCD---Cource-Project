
*Technical details:*

1. The script supposes that the working directory (set via setwd()) is  …/UCI HAR Dataset with the folder structure as in provided archive.

2. The script was successfully run and written on Linux Ubuntu 14.04 LTS, 4GB DDR3 L memory. R version 3.2.2 (2015-08-14) -- "Fire Safety".

*Answers to possible questions:*

-Q: Why only 68 columns?
-A: Because only 66 values are actual means or standart deviations. First I used partial match in the column names to get the correct columns from each raw data set. Than I removed meanFreq columns, because they are just preparatory data for mean calculation. This leaves you with 66 means & std's . Then I added persons and activity types.

-Q: This awful column_names vector...
-A:Yes it was not pleasant to create it. And Yes I could have written a script (even based on a grammar, may be) for the naming process, but this is not the best way if you do not feel confident about the names of the columns and change it several times a day. 

-Q: What is this «memory care» stuff about?
-A: I hate when the enviroment is full of litter and, by the way, it eats memory.


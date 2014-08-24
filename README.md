DataSci_Coursera_GetAndClean
============================

Data Science Coursera course for the Getting and Cleaning Data assignment.

Files present in this project and their purpose:-
- README.md      : This file. Describes other files in repository, and how to use the script.
- CodeBook.md    : This is a description of the codes in the data output.
- run_analysis.R : This is a script that performs the manipulation of the raw data into a tidy dataset.

Explanation of run_analysis.R
=============================
The R script reads in the text files of the activity labels, and the various feature variables being measured.
It then reads into memory, for both the 'train' and 'test' sets of data, the three files containing readings for which candidate (a.k.a. subject), activity (a.k.a Y) and what values exists for each variable over a number of samples.

It then joins together the three files for both 'train' and 'test' sets of data.
Rename the column names in the candidate and activity data sets to be more meaningful.

Restrict the variables being analysed to just those for 'mean' and 'std' (standard-deviation), and replace the column names with a more descriptive column name for the variable.

Combine the candidate, activity and variable data sets together, into one dataset.

Then use the imported 'plyr' package to calculate the mean average of the variables,
per combination of candidate and activity. This summarizes the data into a tidy data set.

Finally, write out the tidy data set as a text file.

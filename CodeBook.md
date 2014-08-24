---
title: "CodeBook"
author: "EddyGray"
date: "Sunday, August 24, 2014"
output: html_document
---

"Study design"
==============
The original raw data for this study came from:-
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

"Code book"
===========
The definition and units of the variables in the data have not differed from those available
in the link above for the motion of the sensors.
The 'activity' column holds a category number of 1 to 6 that correponds respectively to the 
values 'WALKING', 'WALKING UPSTAIRS', 'WALKING DOWNSTAIRS', 'SITTING', 'STANDING' and 'LAYING'.
The 'candidate' column holds a number to represent the anonymous subject who gave rise to the measurements 
for the variables.

The data has now been combined across 'test' and 'training' data to return to all those candidates who provided data, and has been summarized to the level of candidate and activity being undertaken.


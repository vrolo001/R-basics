######Section 1: R Basics, Functions, and Data Types######
###Section 1.2: R Basics

  #1: Define n<-100 then use R to compute the sum of 1 through 100. What is the sum?
n<-100
n*(n+1)/2
  #2: Change the value of n to 1000 and calculate the sum of the first 1000 integers
n<-1000
n*(n+1)/2
  #3: Use one line of code to compute the log, to the base 10, of the square root of 100
log10(sqrt(100))

###Section 1.3: Data Types
library(dslabs)
data(murders)

  #1: Extract the variable names of the data frame
str(murders)
names(murders)
  #2: Use the accessor to extract the state abbreviations and see their class
class(murders$abb)
  #3: Use the square brackets to extract the state abbreviations and use the identical function to determine if this gives the same results as using the $
identical (murders$abb, murders [["abb"]])
  #4:Use the functions levels and length to determine the number of regions defined by this dataset and contained in murders$region
length(levels(murders$region))
  #5: Use the table function in one line of code to create a table showing the number of states per region.
table(murders$region)


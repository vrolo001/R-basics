###### Section 4 Assessment for verified learners ######

library(dslabs)
data(heights)

  #Q1: Using the heights data, write an ifelse statement that returns 1 if the sex is female and 2 if the sex is male.
      #What is the sum of the resulting vector?

heights_if <- ifelse(heights$sex == "Female", 1,2)
sum(heights_if)

  #Q2: Write an ifelse statement that takes the height column and returns the height if it is greater than 72 inches and returns 0 otherwise
      #What is the mean of the resulting vector?

heights_height <- ifelse (heights$height > 72, heights$height, 0)
mean(heights_height)

  #Q3: Write a function inches_to_ft that takes a number of inches x and returns the number of feet. One foot equals 12 inches.
      #What is inches_to_ft(144)

inches_to_ft <- function(x){
  x/12
}

inches_to_ft(144)

    #How many individuals in the heights dataset have a height less than 5 feet?

shorties <- ifelse(inches_to_ft(heights$height) < 5 , 1, 0)
sum(shorties)

  #Q5: Given an integer x, the factorial of x is called x! and is the product of all integers up to and including x. The factorial() function computes factorials in R
      #Complete the code below to generate a vector of length m where the first entry is 1!, the second entry is 2!, and so on up to m!

# define a vector of length m
m <- 10
f_n <- vector(length = m)

# make a vector of factorials
for (n in 1:m) {
  f_n[n] <- factorial(n)
}

# inspect f_n
f_n




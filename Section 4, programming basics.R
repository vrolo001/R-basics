#######Section 4: Programming basics######

###Section 4.4: for loops
library(dslabs)
data(murders)

  #1:Assign the state abbreviation when the state name is longer than 8 characters
new_names<-ifelse(nchar(murders$state)>8,murders$abb,murders$state)
  #2: Create a function sum_n that for any given value, say n, creates the vector 1:n, and then computes the sum of the integers from 1 to n.
      #Use the function to determine the sum of integers from 1 to 5000
sum_n<-function(n){
  v<-1:n
  sum(v)
}
sum_n(5000)
  #3: Create a function altman_plot that takes two arguments x and y and plots y-x (on the y-axis) against x+y (on the x-axis).
altman_plot<-function(x,y){
  plot(x+y,y-x)
}
  #4: Write a function compute_s_n with argument n that for any given n computes the sum of 1 + 2^2 + ...+ n^2. Report the value of the sum when n=10
compute_s_n<-function(n){
  x<-(1:n)
  sum(x^2)
}
compute_s_n(10)
  #5: Define an empty numeric vector s_n of size 25 using s_n <- vector("numeric", 25). Compute the the sum when n is equal to each integer from 1 to 25 using the function we defined in the previous exercise: compute_s_n. Save the results in s_n
s_n<-vector("numeric",25)
for (i in 1:25){
  s_n[i]<-compute_s_n(i)
}
  #6: Check your math by defining the vector n with the numbers 1 to 25 and plotting s_n against n
n <- 1:25
plot(n,s_n)
  #7: Confirm that s_n and n*(n+1)*(2*n+1)/6 are the same
identical (s_n, n*(n+1)*(2*n+1)/6)

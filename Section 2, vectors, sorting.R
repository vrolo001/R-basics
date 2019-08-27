#######Section 2: Vectors, sorting######

###Section 2.1: Vectors

  #1: Create a numeric vector with the average high temperatures in January for Beijing, Lagos, Paris, Rio de Janeiro, San Juan, and Toronto. The average high temperatures are 35, 88, 42, 84, 81, and 30 degrees Fahrenheit. 
temp<- c(Beijing=35, Lagos = 88, Paris= 42, Rio=84, SJuan=81, Toronto=30)
  #2: Create a character vector with the above city names
city<-c( "Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
  #3: Use the names function and the objects defined in the previous exercises to associate the temperature data with its corresponding city. 
temp <- c(35, 88, 42, 84, 81, 30)
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
names(temp)<-city
  #4: Use the [ and : operators to access the temperature of the first three cities in the list
temp[1:3]
temp[c(1:3)]
  #5: Use the [ operator to access the temperature of Paris and San Juan 
temp[c(3, 5)]
 #6: Use the : operator to create a sequence of consecutive integers starting at 12 and ending at 73 and save it in an object x, then determine the length of object x
x<-12:73
length(x)
  #7: Create a vector containing all the positive odd numbers smaller than 100. The numbers should be in ascending order.
seq(1, 99, 2)
  #8: Create a vector of numbers that starts at 6, does not go beyond 55, and adds numbers in increments of 4/7. So the first three numbers will be 6, 6+4/7, and 6+8/7. How many numbers does the list have? Use only one line of code to answer both questions.
length(seq(6, 55, 4/7))
  #9: Determine the class of a vector generated with seq using the length.out argument
class(seq(1, 10, length.out = 100))
  #10: What is the class of the following object a <- seq(1, 10)?
class (a)
  #11: Confirm that the class of 1 is numeric and the class of 1L is integer.
class (1)
class(1L)
  #12: Define the following vector: x <- c(1, 3, 5,"a"). Convert x to a vector of numbers
x <- c(1, 3, 5,"a")
as.numeric(x)

###Section 2.2: Sorting
library(dslabs)
data(murders)

  #1: Use the $ operator to access the population size data and store it in the object pop. Then use the sort function to redefine pop so that it is sorted. Finally use the [ operator to report the smallest population size.
pop<-murders$population
pop<-sort(pop)
pop[1]
    #shorter alternative
    pop<-sort(murders$population)
    pop[1] #OR 
    (sort(murders$population))[1]
  #2: Find out the row number of the state with the smallest population size
pop<-murders$population
ord<-order(pop)
which.min(pop)
    #alternative (and exercise 3)
    which.min(murders$population)
  #4: Find the index of the smallest state. Define a variable states to hold the state names. Combine these to find the state name for the smallest state.
i<-which.min(murders$population)
states<- murders$state
murders$state[i]
    #my alternative
    murders$state[which.min(murders$population)]
  #5: Define a variable states to be the state names from murders. Use rank(murders$population) to determine the population size rank (from smallest to biggest) of each state.
      #Save these ranks in an object called ranks. Create a data frame with state names and their respective ranks
states<-murders$state
ranks<-rank(murders$population)
my_df<-data.frame (state=states, rank=ranks)
    #my alternative
    df<-data.frame(state=murders$state, rank=rank(murders$population))
  #6: Repeat the previous exercise but this time order my_df so that the states are ordered from least populous to most
ind<-order(ranks)
my_df<-data.frame(states= states[ind], ranks = ranks[ind])
  #7:Use the na_example dataset. Assign the logical vector that is returned by is.na(na_example) to an object called ind. Determine how many NAs the dataset has
library(dslabs)
data(na_example)

ind<-is.na(na_example)
sum(ind)
  #8: Write one line of code to compute the average, but only for the entries that are not NA
mean(na_example[!is.na(na_example)])

###Section 2.3: Vector Arithmetic

  #1:Convert the temp vector to Celsius and create a data frame city_temps with the city  names and temperatures in Celsius
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
temp <- c(35, 88, 42, 84, 81, 30)
temp<- 5/9*(temp-32)
city_temps<-data.frame (name=city, temperature= temp)
  #2: What is the sum of the following equation: 1 + 1/2^2 + 1/3^2 + ... + 1/100^2? 
x<-1:100
sum(1/x^2)
  #3: Compute the per 100,000 murder rate for each state and store it in the object murder_rate, then compute the average for the US
murder_rate<-murders$total/murders$population*100000
mean(murder_rate)
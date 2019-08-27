#######Section 3: Vectors, sorting######

###Section 3.1: Indexing
library(dslabs)
data(murders)

  #1: Compute the per 100,000 murder rate for each state and store it in an object called murder_rate, then use logical operators to create a logical vector low that tells which entries are lower than 1
murder_rate<-murders$total / murders$population * 100000
low<-murder_rate<1
   #2: Use the results from the previous exercise and the function which to determine the indices of murder_rate associated with values lower than 1
which(murder_rate<1)
  #3: Report the names of the states with murder rates lower than 1, using the square brackets to retrieve the names of the states from the dataset.
murders$state[murder_rate<1]
  #4: Extend the code from the previous exercises to report the states in the Northeast with a murder rate lower than 1
murders$state[murder_rate<1 & murders$region == "Northeast"]
  #5 How many states are below the average murder rate
sum(murder_rate<mean(murder_rate))
  #6: Identify the states with abbreviations AK, MI, and IA
abbs<-c("AK", "MI", "IA")
murders$state[match(abbs, murders$abb)]
  #7: Which of the following are actual abbreviations: MA, ME, MI, MO, MU?
abbs<-c("MA", "ME", "MI", "MO", "MU")
abbs %in% murders$abb
  #8 Use which and the ! operator to get the index of the entries of abbs that are not abbreviations.
which(!abbs %in% murders$abb)
abbs[which(!abbs %in% murders$abb)]

###Section 3.2: Basic data wrangling
library(dplyr)
library(dslabs)
data(murders)

  #1: Redefine murders so that it includes a column named rate with the per 100,000 murder rates
murders<-mutate(murders, rates = total/population*100000)
  #2: Redefine murders to include a column named rank with the ranks of rate from highest to lowest
rate <-  murders$total/ murders$population * 100000
murders<- mutate(murders, rank = rank(-rate))
  #3: Use select to show the state names and abbreviations in murders
select(murders, state, abb)
  #4: Filter to show the top 5 states with the highest murder rates
murders <- mutate(murders, rate = total/population * 100000, rank = rank(-rate))
filter(murders,rank <=5)
  #5: Create a new data frame called no_south that removes states from the South region. How many states are in this category?
no_south<-filter(murders, region!= "South")
nrow(no_south)
  #6: Create a new data frame called murders_nw with only the states from the Northeast and the West.How many states are in this category?
murders_nw<-filter(murders, region %in% c("Northeast", "West"))
nrow(murders_nw)
  #7: Create a table my_states that satisfies both the conditions: it is in the Northeast or West and the murder rate is less than 1. Use select to show only the state name, the rate and the rank
murders <- mutate(murders, rate =  total / population * 100000, rank = rank(-rate))
my_states<- filter(murders, rate<1 & region %in% c("Northeast", "West"))
select(my_states, state, rate, rank)
  #8: Repeat the previous exercise, but now instead of creating a new object, show the result and only include the state, rate, and rank columns using the %>% pipe operator
mutate(murders, rate =  total / population * 100000, rank = rank(-rate))%>%
  filter(rate<1 & region %in% c("Northeast", "West"))%>%
  select(state,rate,rank)
  #9: Use one line of code to create a new data frame, called my_states, that has murder rate and rank columns, considers only states in the Northeast or West which have a murder rate lower than 1, and contain only the state, rate, and rank columns.
my_states<- murders %>% 
  mutate(rate = total/population * 100000, rank = rank(-rate)) %>%
  filter (region %in% c("Northeast", "West") & rate<1) %>% 
  select (state, rate, rank)

###Section 3.3: Basic plots
library(dslabs)
data(murders)

  #1: Transform population and total gun murdres using the log 10 transformation. Create a scatterplot with the log scales
population_in_millions <- murders$population/10^6
total_gun_murders <- murders$total
log10_population<-log10(murders$population)
log10_total_gun_murders<-log10(total_gun_murders)
plot(log10_population, log10_total_gun_murders)
  #2: Create a histogram of the population in millions
hist(population_in_millions)
  #3: Create a boxplot of state populations by region for the murders dataset
boxplot(population~region,data=murders)
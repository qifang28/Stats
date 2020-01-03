library(tidyverse)
library(nycflights13)
#1. Refer back to the lists of useful mutate and filtering functions. 
# Describe how each operation changes when you combine it with grouping.
# filter() allows you to subset observations based on their values
# mutate() to add new columns that are functions of existing columns
# Order of the variable changes when using group_by
# A grouped filter is a grouped mutate followed by an ungrouped filter

#2 Which plane (tailnum) has the worst on-time record?
flights %>% 
  filter(!is.na(dep_delay)) %>%
  group_by(tailnum) %>%
  summarise(n = n(),
            late = sum(arr_delay >= 0)/n)  %>%
            #arr_time = mean(arr_delay, na.rm = TRUE),
            #n = n()
  arrange(desc(late))

#3 What time of day should you fly if you want to avoid delays as much as possible?
flights %>%
  group_by(hour) %>%
  filter(!is.na(dep_delay)) %>%
  summarise( delay = mean( dep_delay > 0 , na.rm = T)) %>%
  ggplot(aes(hour, delay, fill = delay)) + geom_line() +
  labs(x = 'hour', y = 'most delayed')
#4 For each destination, compute the total minutes of delay. For each flight, 
# compute the proportion of the total delay for its destination.
flights %>%
  group_by(dest) %>%
  filter(!is.na(dep_delay)) %>%
  summarise(delay = sum(dep_delay>0, na.rm = T))

flights %>%
  group_by(tailnum, dest) %>%
  filter(!is.na(dep_delay)) %>%
  summarise(mean_delay = mean(dep_delay>0, na.rm = T))
  arrange(desc(mean_delay))
  
#5 Delays are typically temporally correlated: even once the problem that caused 
# the initial delay has been resolved, later flights are delayed to allow earlier flights to leave. 
# Using lag(), explore how the delay of a flight is related to the delay of the immediately preceding flight.
?lag
# I don't know

#6 Can you find flights that are suspiciously fast? (i.e. flights that represent a potential data entry error). 
# Compute the air time a flight relative to the shortest flight to that destination. 
# Which flights were most delayed in the air?
flights %>%
  group_by(dest) %>%
  mutate(shortest = air_time - min(air_time, na.rm = TRUE)) %>%
  top_n(1, air_time) %>%
  arrange(-air_time) %>%
  select(tailnum, sched_dep_time, sched_arr_time, shortest)
#7 Find all destinations that are flown by at least two carriers. 
# Use that information to rank the carriers.
flights %>%
  group_by(dest) %>%
  filter(n_distinct(carrier) > 2) %>%
  group_by(carrier) %>%
  summarise(n = n_distinct(dest)) %>%
  arrange(-n)
#8 For each plane, count the number of flights before the first delay of greater than 1 hour
flights %>%
  mutate(dep_date = time_hour) %>%
  group_by(tailnum) %>%
  arrange(dep_date) %>%
  mutate(cumulative = !cumany(arr_delay > 60)) %>%
  filter(cumulative == TRUE) %>%
  tally(sort = TRUE)
# This code is copied, I'm trying to understand all the functions

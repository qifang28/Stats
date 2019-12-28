library(tidyverse)
library(nycflights13)
#1 Brainstorm at least 5 different ways to assess the typical delay characteristics of a group of flights.
##1.1 A flight is 15 minutes early 50% of the time, and 15 minutes late 50% of the time.
#summarise(mean = mean(dep_delay, na.rm = TRUE))
flights %>%
  group_by(flight) %>%
  summarise(n = n(),
            fif_early = mean(arr_delay == -15, na.rm = TRUE),
            fif_late = mean(arr_delay == 15, na.rm = TRUE),
  ) %>%
  # mean: the proportion
  filter(fif_early == 0.5, fif_late == 0.5)
##1.2 A flight is always 10 minutes late.
flights %>%
  group_by(flight) %>%
  summarise(n = n(),
            mean(arr_delay == 10, na.rm = TRUE)
  )     
##1.3 A flight is 30 minutes early 50% of the time, and 30 minutes late 50% of the time.
flights %>%
  group_by(flight) %>%
  summarise(n = n(),
            thir_early = mean(arr_delay == 30, na.rm = TRUE),
            thir_late = mean(arr_delay == - 30, na.rm = TRUE)
  ) %>%
  filter(thir_early == 0.5,thir_late == 0.5 )
#1.4 99% of the time a flight is on time. 1% of the time it’s 2 hours late.
flights %>%
  group_by(flight) %>%
  summarise(n = n(),
            on_time = mean(arr_delay == 0, na.rm = TRUE),
            late = mean(arr_delay == 120, na.rm = TRUE)
  ) %>%
  filter(on_time == 0.99,late == 0.01 )

#2 Come up with another approach that will give you the same output
# as not_cancelled %>% count(dest) and not_cancelled %>% count(tailnum, wt = distance) 
# (without using count()).
not_cancelled <- flights %>% 
filter(!is.na(dep_delay), !is.na(arr_delay))
not_cancelled %>%
  group_by(dest) %>%
  summarise(n=n())
not_cancelled %>%
  group_by(tailnum) %>%
  summarise(n = sum(distance))
#3 Our definition of cancelled flights (is.na(dep_delay) | is.na(arr_delay) ) 
# is slightly suboptimal. Why? Which is the most important column?
# If there is no value in departure delay, it means the flight is cancelled.
#4 Look at the number of cancelled flights per day. Is there a pattern? 
# Is the proportion of cancelled flights related to the average delay?
flights %>%
  group_by(day) %>%
   summarise(cancel = sum(is.na(dep_delay)),
             dep = sum(dep_delay, na.rm = TRUE),
             arr = sum(arr_delay, na.rm = TRUE)) %>%
  ggplot(aes(y = cancel)) +
  geom_point(aes(x = dep), color = 'red') +
  geom_point(aes(x = arr)) +
  labs(x = 'delay per day', y = 'cancelled per day')
# the lore delayed flights, the more cancelled flights
#5 Which carrier has the worst delays? Challenge: 
# can you disentangle the effects of bad airports vs. bad carriers?
# Why/why not? (Hint: think about flights %>% group_by(carrier, dest) %>% summarise(n()))

flights %>%
  group_by(carrier) %>%
  summarise(n= n(),
            dep_max = max(dep_delay, na.rm = TRUE),
            arr_max = max(arr_delay, na.rm = TRUE)) %>%
  #arrange(desc(dep_max, arr_max)) %>%
  filter(1:n() == 1)

#6 What does the sort argument to count() do. When might you use it?
# when we count the number and want to sort the result
flights %>%
  count(flight, sort = TRUE)
#6
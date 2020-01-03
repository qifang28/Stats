library(tidyverse)
library(nycflights13)
#1 How could you use arrange() to sort all missing values to the start?
df <- tibble(x = c(5, 2, NA))
arrange(df, desc(is.na(x)))
#2 sort flights to find the most delayed flights. 
arrange(flights, dep_delay)
#2 Find the flights that left earliest.
arrange(flights, desc(dep_delay))
#3 Sort flights to find the fastest flights
arrange(flights, desc(air_time))
#4 Which flights travelled the longest? Which travelled the shortest?
flights %>%
  arrange(air_time) %>% #shortest
  select(carrier, flight, air_time)
flights %>%
  arrange(-air_time) %>% #fastest
  select(carrier, flight, air_time)

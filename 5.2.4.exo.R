#1
library(nycflights13)
library(tidyverse)
T1 <- view(flights)
#1.1
table1.1 <- filter(flights, arr_delay >= 120)
view(table1.1)
#1.2
table1.2 <- filter(flights, dest == "IAH" | dest == "HOU" ) #dest %in% c("IAH", "HOU")
view(table1.2)
#1.3
table1.3 <- filter(flights, carrier %in% c("UA", "DL",  "AA") )
view(table1.3)
#1.4
table1.4 <- filter(flights, month %in% c(7, 8, 9) ) #month %in% 7:9
view(table1.4)
#1.5
table1.5 <- filter(flights, arr_delay >= 120 & dep_delay <= 0 )
view(table1.5)
#1.6
table1.6 <- filter(flights, arr_delay >= 60, (dep_delay - arr_delay > 30) )
view(table1.6)
#1.7
table1.7 <- filter(flights, dep_time >= 2400 | dep_time <= 600)
view(table1.7)
#2
#between is to describe the area. We can use it to simplyfy the code of 1.7
filter(flights, between(dep_time, 601, 2359))
#3
table2 <-filter(flights, is.na(dep_time))
#We can see in the environment, table2, 8255 obs, is the same number as the result of sum()
sum(is.na(flights$dep_time))
table3 <- is.na(flights)
view(table3)
#I don't know how to print the variable names that has missing value
#I can only find all the missing value and see the variable name in the table, it's stupid...
#What might these rows represent? Maybe those flights are cancelled
#4
#With ^0, every value equals zero.
#With the "or" symble "|", true or not true, there's a true inside, so it's true.
#FALSE & NA, if one of the value can be tested, then it's true, it's the general rule.


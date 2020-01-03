library(nycflights13)
library(tidyverse)
#1 Convert dep_time, sched_dep_time to a more convenient representation of number of minutes since midnight.
#select(flights, dep_time, sched_dep_time)
transmute(flights,
          dep_time,
          dep_time_hour = dep_time %/% 100,
          dep_time_minute = dep_time %% 100,
          sched_dep_time,
          sched_dep_time_hour = sched_dep_time %/% 100,
          sched_dep_time_minute = dep_time %% 100
          )
#2 Compare air_time with arr_time - dep_time.
table1 <- transmute(flights,
          air_time,
          air_time_hour = air_time %/% 60,
          dep_time_minute = dep_time %% 60,
          arr_time,
          arr_time_hour = dep_time %/% 100,
          arr_time_minute = dep_time %% 100,
          dep_time,
          dep_time_hour = dep_time %/% 100,
          dep_time_minute = dep_time %% 100,
          arrMINUSdep_hour = arr_time_hour - dep_time_hour,
          arrMINUSdep_minute = arr_time_minute - dep_time_minute
)
view(table1)
#What do you expect to see? What do you see? What do you need to do to fix it?
#I see that the result is 0 every where, I think it's normal, because the time is the in the reality
#We do not see the difference between the former plan and the fact
#I think we need to use the departure time in the reality, that is to use sched_arr_time to compare
#3 Compare dep_time, sched_dep_time, and dep_delay. 
table2 <- transmute(flights,
                    dep_time,
                    dep_time_minute = dep_time %/% 100 * 60 + dep_time %% 100,
                    sched_dep_time,
                    sched_dep_time_minute = dep_time %/% 100 * 60 + sched_dep_time %% 100,
                    dep_delay,
                    depMINUSsched_dep = dep_time_minute - sched_dep_time_minute
)
view(table2)
#All the number do not match, because there are some flights depart at the next day
#4 Find the 10 most delayed flights using a ranking function. 
?min_rank()
flights %>%
  filter(min_rank(desc(dep_delay)) %in% 1 : 10)
#How do you want to handle ties?
# I DON'T UNDERSTAND THIS QUESTION!
#5 What does 1:3 + 1:10 return? Why?
1:3 + 1:10
#la taille d'un objet plus long n'est pas multiple de la taille d'un objet plus court
#6 What trigonometric functions does R provide?
?Trig
# They respectively compute the cosine, sine, tangent, arc-cosine, arc-sine, arc-tangent, and the two-argument arc-tangent.
#cospi(x), sinpi(x), and tanpi(x), compute cos(pi*x), sin(pi*x), and tan(pi*x).
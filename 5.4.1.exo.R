library(nycflights13)
#1 Brainstorm as many ways as possible to select dep_time, dep_delay, arr_time, and arr_delay from flights.
select(flights, dep_time, dep_delay, arr_time, arr_delay)
select(flights, starts_with("dep"), starts_with("arr"))
select(flights, matches("^dep|^arr")) #regex
#2 What happens if you include the name of a variable multiple times in a select() call?
select(flights, dep_time, dep_time, dep_time)
#The colone appears just once. So it clean the redondance automatically
#3 What does the one_of() function do? Why might it be helpful in conjunction with this vector?
vars <- c("year", "month", "day", "dep_delay", "arr_delay")
select(flights, one_of(vars))
#We get the tibble with the values stored in the vector "vars"
#Without this vector, we dont know which variable to choose
#4 Does the result of running the following code surprise you?
select(flights, contains("TIME"))
#Yes, here is upper case, but the variable names are lower case, and we can select successefully the variables
#And I see that in the select function, case doesn't matter
#4 How do the select helpers deal with case by default?
#4 How can you change that default?
select(flights, contains("TIME", ignore.case = F))
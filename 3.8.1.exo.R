library(tidyverse)
#1
#The problem is overplotting, we can use jitter to find out if it's true
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point(position = "jitter")
#We see more points with jitter, so that's the problem of over plotting
#2
?geom_jitter
#the 'width' and 'height' will control the amount of jittering.
#3
?geom_count
#geom_jitter is a random variation to the locations points
#geom_data is a propotional number
ggplot(data = mpg, mapping = aes(x = cty, y = hwy, color = class)) +
  geom_jitter()
ggplot(data = mpg, mapping = aes(x = cty, y = hwy, color = class)) +
  geom_count()
#4
?geom_boxplot
#position = "dodge2"
#position = "dodge" places overlapping objects directly beside one another. 
#This makes it easier to compare individual values.
ggplot(data = mpg, mapping = aes(x = cty, y = hwy, color = class)) + 
  geom_boxplot()
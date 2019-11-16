library(tidyverse)
#1
?stat_summary
#the default geom associated with stat_summary() is geom = "pointrange"
?geom_pointrange
#the default stat of geom_pointrange is stat = "identity"
#2
?geom_col
#There are two types of bar charts: geom_bar() and geom_col(). 
#geom_bar() makes the height of the bar proportional to the number of cases in each group 
#(or if the weight aesthetic is supplied, the sum of the weights). 
#If you want the heights of the bars to represent values in the data, use geom_col() instead. geom_bar() 
#uses stat_count() by default: it counts the number of cases at each x position. 
#geom_col() uses stat_identity(): it leaves the data as is.
#3
#I don't know how to find all the pairs
#4
#Aids the eye in seeing patterns in the presence of overplotting. 
#computed variables : y : predicted vamue; ymin : lower pointwise confidence interval around the min
#ymax : upper pointwise confidence interval around the mean; se : standard error
#method, formula and so on control his value
#5
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop..))
#withou the "group = 1", the bars become the same and fill of the graphic
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = color, y = ..prop..))
#Without the "group = 1", the bars are stacked with different colors
#Because the function "geom_bar" defines that the groupes are equal to the "x" values

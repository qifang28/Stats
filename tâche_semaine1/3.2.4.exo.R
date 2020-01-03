#1
library("tidyverse")
ggplot(data = mpg)
#we see nothing
#2
mpg
#mpg has 234 rows and 11 colones
#3
?mpg
#drv
#f = front-wheel drive, r = rear wheel drive, 4 = 4wd
#4
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cyl, y = hwy))
#5
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = drv))
#this doesn't make sense, because in the axe "x" we have different class of cars
#in the axe "y", it's their type of wheel drive, we cannot get some data, they are all categorical.
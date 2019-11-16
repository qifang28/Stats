library(tidyverse)
#1
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
#here we give the variable color a value, "blue"
#type of the variable is string
#it's in the same level with displ and hwy
#2
?mpg
#categorical variables : model, displ, year, cyl, trans, drv, fl, class
#continuous variables : cty, hwy
#in different catogories, the value will change, we will see the difference in the y axe.
#3
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = color))
#Error in FUN(X[[i]], ...) : objet 'color' introuvable
#these three variables cannot be continuous variables
#4
#aesthetics cannot be a continuous variable, it can only add the aesthetic properties
#5
?geom_point
#I didn't find the explication of stroke here but other place, it is to contrl the whole size of the graphic
#6
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = displ < 5))
#We get the true value in blue and false value in red
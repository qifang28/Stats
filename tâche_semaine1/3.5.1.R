library(tidyverse)
#1
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(ctv ~ hwy)
#Erreur : At least one layer must contain all faceting variables: `ctv`.
#* Plot is missing `ctv`
#* Layer 1 is missing `ctv`
#2
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl)) + 
  facet_grid(drv ~ cyl)
#Empty cells in `facet_grid` imply that there were no rows with that combination of values in the original dataset.
#We see nothing here, because no rows will be printed
#3
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ .)
# ~ .means demonstrate the horizon tables, to see more clearly the changes in x axe
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(. ~ drv)
# . ~  means demonstrate the vertical tables, to see more clearly the changes in y axe
#4
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
#With the color variable, all the values are in the same tables, but with facet we can see every variable in a seperate table
#The disadvantage is that we cannot compare it in a same table
#If it is a larger dataset, in a same table we cannot see it clearly
#5
?facet_wrap
#nrow and ncol, number of rows and columns.
#other options : scales = "fixed",
#shrink = TRUE, labeller = "label_value", as.table = TRUE,
#switch = NULL, drop = TRUE, dir = "h", strip.position = "top"
?facet_grid
#facet_grid() forms a matrix of panels defined by row and column
#6
#Because for forming a matrix we need two variables.

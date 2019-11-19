#1
my_variable <- 10
my_varıable
#Erreur : objet 'my_varıable' introuvable
#Because R or all the code are sensible to spelling. 
#We have to type exactly the same variable names to recall a variable
#2
library(tidyverse)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
filter(mpg, cyl == 8)
filter(diamonds, carat >3)
#a single = means assigne the variable a value, here we need a constant, so use "=="
#diamond is not a data of the library tidyverse, but diamonds
#3
#For Mac, it's command + shift + k, a window apprears:
#Compile Report from R Script, creat a standalone report that contains the code and output from your R script
#Tools --> Keyboard shortcuts help

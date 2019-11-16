library(tidyverse)
#1
#line chart: geom_line()
#boxplot: geom_boxplot()
#histogram: geom_histogram()
#area chart: geom_area()
#2
#I think the points and the a line will be in the same table, with different colors clissified by drv
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)
#3
#with show.legend = FALSE we will not see the indication of the variable drv at right 
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv)
  )
#because it is evident that the three lines present the variable drv's value 
#4
#se is to modify if we keep the shadow
#5
#The two graphics look the same, it's just that the fist one is more easy to reuse.
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))
#6
#graphic 1
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(size = 4) + 
  geom_smooth(se = FALSE)
#graphic 2
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, group = drv)) + 
  geom_point(size = 4) + 
  geom_smooth(se = FALSE)
#graphic 3
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point(size = 4) + 
  geom_smooth(se = FALSE)
#graphic 4
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = drv),size = 4) + 
  geom_smooth(se = FALSE)
#graphic 5
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = drv), size = 4) + 
  geom_smooth(mapping = aes(linetype = drv), se = FALSE)
#graphic 6
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(size = 6, color = "white") +
  geom_point(aes(color = drv), size = 3)
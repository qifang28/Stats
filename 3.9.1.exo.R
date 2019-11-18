library(tidyverse)
#1
bar <- ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))
bar + coord_polar()
#2
?labs
#Modify axis, legend, and plot labels
#3
?coord_map
#coord_map projects a portion of the earth, 
#which is approximately spherical, 
#onto a flat 2D plane using any projection defined by the mapproj package. 
#Map projections do not, in general, preserve straight lines, so this requires considerable computation. 
#coord_quickmap is a quick approximation that does preserve straight lines. 
#It works best for smaller areas closer to the equator.
#4
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
    geom_point() + 
    geom_abline() 
##coord_fixed()
#Without coord_fixed(), the angle of the graphic will not be fixed, 
#It will be difficult to compare the value of different graphics.
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
#  geom_abline() +
  coord_fixed()
#Without the geom_abline, we have no longer the line that has an angle of 45° to help us to compare the value. 
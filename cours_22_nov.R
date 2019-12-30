library(tidyverse)
library(dplyr)
#le fichier txt n'est pas parfait pour R, on supprime la premier colonne
e1clean <- read.table("e1clean.txt", header = TRUE,
                      stringsAsFactors = FALSE)
#stringAsFactors change la caractère automatiquement, il faut le fermer
region_order <- c("CL", "BEI", "RCNP", "RCV", "de", "headnoun", "Adv", "MainV", "MainO")
e1clean <- mutate(e1clean, roi=factor(roi, levels = region_order))

mean_grouped <- e1clean %>%
  group_by(condition, roi) %>%
  summarize(
  mRTt = mean(RT, na.rm = TRUE)
  )  %>%
  ungroup()
#ggplot(data = mean_grouped, mapping = aes(x = roi, y = mRTt, color = condition)) +
  #geom_point() 
ggplot(data = mean_grouped, mapping = aes(x = roi, y = mRTt,group = condition, linetype = condition, shape = condition)) +
  geom_line() + 
  geom_point() +
  labs(x = 'Region', y = 'Reading time (ms)')


#ggplot(data = e1clean) + 
  #geom_bar(mapping = aes(x = condition))
#ggplot(data = e1clean, mapping = aes(x = roi, y = RT,) +
 # geom_line(aes(size = 3)) +
  #geom_smooth(se = FALSE) 
#ggplot(data = e1clean) + 
  #stat_summary(
    #mapping = aes(x = roi, y = RT),
    #fun.ymin = min,
    #fun.ymax = max,
   # fun.y = median
 # )

##ggplot(data = e1clean) + 
##  geom_bar(mapping = aes(x = roi, fill = condition), position = "dodge", group = 1)
##problem, ils sont rempli des bars, 

#La partie importante, changer l'ordre 
#region_order <- c("CL", "BEI", "RCNP", "RCV", "de", "headnoun", "Adv", "MainV", "MainO")
#e1clean <- mutate(e1clean, roi=factor(roi, levels = region_order))

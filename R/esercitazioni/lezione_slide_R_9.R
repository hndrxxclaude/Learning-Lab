library(tidyverse)
ggplot2::mpg
?mpg

ggplot(data = mpg) +
  geom_point(aes(x = displ,
                 y= hwy)) +
  geom_smooth(aes(x = displ,
                  y= hwy))

ggplot(data = mpg,aes(x = displ,
                      y= hwy)) +
  geom_smooth() +
  geom_point()

ggplot(data = mpg, 
       mapping = aes(x = displ, y = hwy)) + 
  geom_point() +
  
  geom_point(data = filter(mpg, displ > 5, hwy >20),
             colour = "red", size = 0.5)

mpg %>%
  count(class)

ggplot(mpg) +
  geom_point(aes(x = displ,
                 y = hwy,
             color = class))

ggplot(mpg) +
  geom_point(aes(x = displ,
                 y = hwy,
                 color = "blue"))

pnorm(-0.56)


# library(tidyverse)
# d <- ggplot(mtcars, aes(cyl, mpg)) + geom_point()
# d + stat_summary(fun.data = "mean_cl_boot", colour = "red", linewidth = 2, size = 3)
# # You can supply individual functions to summarise the value at
# # each x:
# d + stat_summary(fun = "median", colour = "red", size = 2, geom = "point")
# # d + stat_summary(fun = "mean", colour = "red", size = 2, geom = "point")
# # d + aes(colour = factor(vs)) + stat_summary(fun = mean, geom="line")
# Orientation follows the discrete axis
# ggplot(mtcars, aes(mpg, factor(cyl))) +
#   geom_point() +
#   stat_summary(fun.data = "mean_cl_boot", colour = "red", linewidth = 2, size = 3)

library(tidyverse)
ggplot(mtcars, aes(cyl, mpg)) +
  geom_point() +
  stat_summary(fun = "mean", color = "#007c7c", size = 4, geom = "point") +
  theme_minimal()
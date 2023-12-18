
# stats

# library(tidyverse)
# d <- ggplot(mtcars, aes(cyl, mpg)) + geom_point()
# d + stat_summary(fun.data = "mean_cl_boot", colour = "red", linewidth = 2, size = 3)

# # You can supply individual functions to summarise the value at each x:
# d + stat_summary(fun = "median", colour = "red", size = 2, geom = "point")
# # d + stat_summary(fun = "mean", colour = "red", size = 2, geom = "point")
# # d + aes(colour = factor(vs)) + stat_summary(fun = mean, geom="line")

# Orientation follows the discrete axis
# ggplot(mtcars, aes(mpg, factor(cyl))) +
#   geom_point() +
#   stat_summary(fun.data = "mean_cl_boot", colour = "red", linewidth = 2, size = 3)

# library(tidyverse)
# ggplot(mtcars, aes(cyl, mpg)) +
#   geom_point() +
#   stat_summary(fun = "mean", color = "#007c7c", size = 4, geom = "point") +
#   theme_minimal()

# library(tidyverse)
# ggplot(mtcars, aes(cyl)) +
#   stat_bin(bins = 3, geom = "bar") +
#   theme_minimal()

library(tidyverse)
library(patchwork)
p1 <- ggplot(diamonds, aes(x = carat)) +
  scale_x_continuous(limits = c(0, 3)) +
  stat_bin(aes(y = after_stat(density)), binwidth = .1, geom = "point") +
  theme_minimal()

p2 <- ggplot(diamonds, aes(x = carat)) +
  stat_bin(aes(y = after_stat(density)), binwidth = .1, geom = "point", color = "red") +
  scale_x_continuous(limits = c(0, 3)) +
  theme_minimal()

p1 / p2

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

# library(tidyverse)
# library(patchwork)
# p1 <- ggplot(diamonds, aes(x = carat)) +
#   scale_x_continuous(limits = c(0, 3)) +
#   stat_bin(aes(y = after_stat(density)), binwidth = .1, geom = "point") +
#   theme_minimal()

# p2 <- ggplot(diamonds, aes(x = carat)) +
#   stat_bin(aes(y = after_stat(density)), binwidth = .1, geom = "point", color = "red") +
#   scale_x_continuous(limits = c(0, 3)) +
#   theme_minimal()

# p1 / p2

# library(tidyverse)
# library(patchwork)
# data(diamonds)

# p1 <- ggplot(diamonds, aes(log10(carat), price)) +
#   geom_point() +
#   theme_minimal()

# p2 <- ggplot(diamonds, aes(carat, price)) +
#   geom_point() +
#   scale_x_log10() +
#   theme_minimal()

# p1 / p2

# Equivalent fill scales do the same job for the fill aesthetic
# ggplot(mtcars, aes(mpg, disp)) +
#   geom_point(aes(color = disp), size = 3) +
#   scale_color_gradient2(mid = "#008c8c", midpoint = mean(mtcars$disp)) +
#   theme_minimal()


library(tidyverse)
library(patchwork)
# p1 <- ggplot(mtcars, aes(mpg, disp)) +
#   geom_point(aes(color = disp), size = 3) +
#   scale_color_gradientn(
#     colours = viridis::viridis_pal()(2), 
#     breaks = scales::breaks_width(50)
#     # guide = "colorsteps"
#   ) +
#   theme_minimal()
# set.seed(123)
# test_df <- tibble(
#   id = 1:1000,
#   value = rnorm(1000)
# )

# p2 <- ggplot(test_df, aes(id, value)) +
#   geom_point(aes(color = value), size = 3) +
#   scale_color_gradientn(
#     colours = viridis::viridis_pal()(2), 
#     values = scales::rescale(mtcars$disp, to = c(0, 1)), 
#     # guide = "colorsteps"
#   ) +
#   theme_minimal()

# # p1 / p2
# print(p2)

# library(ggplot2)
# library(scales) # for rescale function
# library(viridis) # for viridis color palette

# # Load the mtcars dataset
# data(mtcars)

# # Rescale the 'disp' values to a range between 0 and 1
# disp_rescaled <- rescale(mtcars$disp)

# # Create a more impactful color scale
# # We'll create a non-linear transformation for the 'values' parameter
# # that emphasizes the dense regions
# values <- (disp_rescaled)^2 # Squaring to emphasize lower values more

# ggplot(mtcars, aes(mpg, disp)) +
#   geom_point(aes(color = disp), size = 3) +
#   scale_color_gradientn(
#     colours = viridis_pal()(5),
#     values = values, 
#     # guide = "coloursteps"
#   ) +
#   theme_minimal() +
#   labs(color = "Displacement (cc)")

# set.seed(596)
# dsamp <- diamonds[sample(nrow(diamonds), 1000), ]
# ggplot(dsamp, aes(carat, price)) + 
#   geom_point(aes(colour = clarity)) +
#   scale_color_brewer(palette = "Dark2") +
#   theme_minimal()

library(tidyverse)
ggplot(msleep, aes(x = brainwt, y = bodywt)) +
  geom_point(aes(color = vore), size = 3) +
  scale_x_log10() +
  scale_y_log10() +
  scale_color_manual(
    values = c(carni = 'red', insecti = 'yellow', herbi = 'green', omni = 'blue')) +
  theme_minimal()
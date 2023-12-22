
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


# library(tidyverse)
# library(patchwork)
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

# library(tidyverse)
# ggplot(msleep, aes(x = brainwt, y = bodywt)) +
#   geom_point(aes(color = vore), size = 3) +
#   scale_x_log10() +
#   scale_y_log10() +
#   scale_color_manual(
#     values = c(carni = 'red', insecti = 'yellow', herbi = 'green', omni = 'blue')) +
#   theme_minimal()


# library(tidyverse)
# ggplot(mtcars, aes(factor(cyl), fill = factor(vs))) +
#   geom_bar(
#     position = position_dodge2(
#       width = 5,
#       preserve = "single",
#       # padding = .2,
#       # width = 1
#     )
#   ) +
#   theme_minimal() +
#   scale_fill_brewer(palette = "Set2")



# # In this case a frequency polygon is probably a better choice
# ggplot(diamonds, aes(price, colour = cut)) +
#   geom_freqpoly(
#     position = position_dodge2(width = 5)
#   ) +
#   theme_minimal()

# Dodging with various widths -------------------------------------
# To dodge items with different widths, you need to be explicit
df <- data.frame(
  x = c("a","a","b","b"),
  y = 2:5,
  g = rep(1:2, 2)
)
p <- ggplot(df, aes(x, y, group = g)) +
  geom_col(position = "dodge", fill = "grey50", colour = "black")
p
# # So you must explicitly specify the width
p + geom_linerange(
  aes(ymin = y - 1, ymax = y + 1),
  color = "red",
  position = position_dodge2(width = 0.9)
)



# ggplot(diamonds, aes(x = price, group = cut)) +
#   geom_freqpoly(bins = 30)  + # 选择合适的binwidth值
#   stat_bin(bins = 30, geom = "point") +
#   theme_minimal() +
#   scale_color_brewer(palette = "Set2")


# library(tidyverse)
# library(nlme)
# ggplot(Oxboys, aes(age, height, group = Subject)) +
#   geom_line() +
#   stat_smooth(aes(group = 1), method = "lm", se = FALSE) +
#   theme_minimal()


# ggplot(Oxboys, aes(Occasion, height)) +
#   geom_boxplot() +
#   geom_line(aes(group = Subject)) +
#   theme_minimal()

# tibble(
#   x = 1:3,
#   y = 1:3
# ) %>% 
# ggplot(aes(x, y, color = x)) +
#   geom_point(size = 5) +
#   geom_line(lwd = 2) +
#   theme_minimal()

# tibble(
#   x = factor(1:3),
#   y = 1:3
# ) %>% 
# ggplot(aes(x, y, color = x)) +
#   geom_point(size = 5) +
#   geom_line(group = 1, lwd = 2) +
#   theme_minimal()

# tibble(
#   x = 1:3,
#   y = 1:3
# ) %>% 
# ggplot(aes(x, y, color = x, lwd = x)) +
#   geom_point(size = 5) +
#   geom_line() +
#   theme_minimal()

# ggplot(diamonds, aes(color, fill = cut)) +
#   geom_bar(position = position_dodge()) +
#   scale_fill_brewer(palette = "Set1") +
#   theme_minimal()
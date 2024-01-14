
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
# df <- data.frame(
#   x = c("a","a","b","b"),
#   y = 2:5,
#   g = rep(1:2, 2)
# )
# p <- ggplot(df, aes(x, y, group = g)) +
#   geom_col(position = "dodge", fill = "grey50", colour = "black")
# p
# # # So you must explicitly specify the width
# p + geom_linerange(
#   aes(ymin = y - 1, ymax = y + 1),
#   color = "red",
#   position = position_dodge2(width = 0.9)
# )



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

# library(tidyverse)

# ggplot(mpg, aes(displ, hwy)) +
#   geom_point(aes(color = cyl)) +
#   geom_smooth(method = "lm", se = FALSE) +
#   facet_grid(rows = vars(cyl), cols = vars(drv), scales = "free", margins = TRUE) +
#   theme_minimal()


# library(tidyverse)
# types <- head(unique(pull(mpg, manufacturer)))

# mpg %>% filter(manufacturer %in% types) %>% 
#   ggplot(aes(cty, model)) +
#     geom_point(aes(color = manufacturer), size = 2) +
#     scale_color_brewer(palette = "Dark2") +
#     facet_grid(rows = vars(manufacturer), space = "free_y", scales = "free") +
#     theme_minimal() +
#     theme(
#       axis.title.y = element_blank(),
#       panel.background = element_rect(color = "black")
#     )


# library(tidyverse)
# library(patchwork)
# p1 <- ggplot(mpg, aes(displ, cty)) +
#   geom_point() +
#   geom_smooth() +
#   theme_minimal()

# p2 <- ggplot(mpg, aes(cty, displ)) +
#   geom_point() +
#   geom_smooth() +
#   theme_minimal()

# p3 <- ggplot(mpg, aes(cty, displ)) +
#   geom_point() +
#   geom_smooth() +
#   theme_minimal() +
#   coord_flip()

# p1 / p2 / p3

# library(tidyverse)
# library(scales)
# library(patchwork)
# p1 <- ggplot(diamonds, aes(x = carat, y = price)) +
#   geom_point() +
#   scale_x_log10() +
#   scale_y_log10() +
#   theme_minimal()

# p2 <- ggplot(diamonds, aes(x = carat, y = price)) +
#   geom_point() +
#   coord_trans(x = exp_trans(10), y = exp_trans(10)) +
#   theme_minimal() 

# p1 / p2

# library(tidyverse)
# library(broom)
# fit <- lm(cty ~ displ, data = mpg) %>% augment()
# df <- fit %>% 
#   mutate(.abs.resid = abs(.resid))

# ggplot(df, aes(x = displ)) +
#   geom_line(aes(y = .fitted), color = "lightgrey", lwd = 1.5) +
#   geom_segment(aes(xend = displ, y = .fitted, yend = cty), alpha = .2) +
#   geom_point(aes(y = .fitted), shape = 1) +
#   geom_point(
#     mapping = aes(
#       y = cty,
#       size = .abs.resid,
#       fill = .abs.resid
#     ),
#     shape = 21,
#     color = "black"
#   ) +
#   scale_fill_gradient(
#     name = "Residual",
#     low = "black",
#     high = "red"
#   ) +
#   theme_minimal() +
#   guides(
#     size = "none"
#   )

# library(tidyverse)
# library(ggridges)
# library(showtext)
# showtext_auto()
# font_path <- "notes/fonts/SiYuanCN-Heavy.otf"
# font_add("siyuan", font_path)

# df <- read_csv(file = "notes/data/Line_Data.csv")
# data <- mutate(df, date = as.Date(date)) %>% 
#   mutate(
#     min_val = map2_dbl(AMZN, AAPL, min),
#     max_val = map2_dbl(AMZN, AAPL, max)
#   )

# ggplot(data, aes(x = date)) +
#   geom_ridgeline_gradient(
#     aes(y = min_val, height = max_val - min_val,  fill = max_val - min_val)
#   ) +
#   geom_line(aes(y = AMZN), color = "black", lwd = 0.75) +
#   geom_line(aes(y = AAPL), color = "black", lwd = 0.75) +
#   scale_x_date(date_breaks = "1 year") +
#   theme_minimal() +
#   scale_fill_gradientn(colours = brewer.pal(9, "YlGnBu"), name = "Value")+
#   theme(
#     text = element_text(family = "siyuan"),
#     legend.direction = "horizontal",
#     legend.position = c(1, 0.1),
#     legend.justification = c(1, 1),   
#     legend.background = element_blank(),
#   ) 


# library(tidyverse)
# library(showtext)

# showtext_auto()
# font_path <- "notes/fonts/SiYuanCN-Heavy.otf"
# font_add("siyuan", font_path)

# tibble(
#     cat = LETTERS[1:12],
#     num = rnorm(12, mean = 12, sd = 4)
# ) %>%
#   ggplot() +
#   geom_col(aes(x = cat, y = num, fill = num), position = "dodge2") +
#   geom_hline(aes(yintercept = y), data = data.frame(y = seq(0, 20, 5)), linewidth = 1, color = "lightgrey", alpha = 0.9) +
#   geom_point(aes(x = cat, y= mean(num)), color = "black", size = 5) +
#   geom_segment(aes(
#       x = cat,
#       y = 0,
#       xend = cat,
#       yend = num
#   ), color = "black", linewidth = 1.2, linetype = "dashed") +
#   labs(title = "Circle Bar Plot") +
#   scale_y_continuous(
#       limits = c(-12, 20),
#       breaks = seq(-10, 20, by = 5)
#   ) +
#   theme_minimal() +
#   theme(
#     text = element_text(family = "siyuan"),
#     plot.title = element_text(size = 20),
#     panel.grid.major.y = element_blank(),  
#     panel.grid.minor.x = element_blank(),      
#     axis.title.x = element_blank(),
#     axis.title.y = element_blank(),
#     axis.text.y = element_blank(),
#     axis.text.x = element_text(size = 18, face = "bold", family = "siyuan"),
#     legend.position = "bottom",
#     legend.title = element_text(size = 20, family = "siyuan"),
#     legend.text = element_text(size = 15, family = "siyuan")
# ) +
#   coord_polar() +
#   geom_text(x = 7.5, y = -12.6, label = "This is \na circle \nbar plot", size = 10, family = "siyuan") +    
#   guides(
#     fill = guide_colorsteps(
#         title = "the number of letters", 
#         title.position = "top", 
#         title.hjust = .5,
#         barwidth = 20, 
#         barheight = 1)
#   )

# 未完成的南丁格尔玫瑰图

# library(tidyverse)
# library(showtext)

# showtext_auto()
# font_path <- "notes/fonts/SiYuanCN-Heavy.otf"
# font_add("siyuan", font_path)

# date <- c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday", "Sunday")

# data <- tibble(
#   a = fct(date),
#   b = c(50, 60, 70, 20, 90, 110, 30)
# )

# angle <- seq(0, 360, length.out = length(data$a))

# ggplot(data) +
#   geom_bar(
#     mapping = aes(x = a, y = b),
#     width = 1,
#     stat = "identity",
#     color = "black",
#     fill = "#F8766D"
#   ) +
#   geom_text(aes(x = a, y = b - 8, label = b), color = "white", size = 4) +
#   geom_vline(xintercept = .5) +
#   coord_polar(theta = "x", start = 0) +
#   ylim(c(0, 120)) +
#   theme_minimal() +
#   theme(
#     text = element_text(family = "siyuan"),
#     axis.title = element_blank(),
#     panel.grid.major = element_line(color = "grey50", linewidth = .25),
#     axis.text.y = element_text(size = 10, color = "black"),
#     axis.text.x = element_text(size = 10, color = "black", angle = 0)
#   )

# library(tidyverse)
# library(showtext)

# showtext_auto()
# font_path <- "notes/fonts/SiYuanCN-Heavy.otf"
# font_add("siyuan", font_path)

# data <- read_csv("notes/data/Population_Pyramid_Data.csv", col_select = -1)
# new_data <- mutate(data, age = fct(age)) %>% 
#   mutate(pop = if_else(gender == "female", -pop, pop))

# ggplot(new_data) +
#   geom_col(aes(x = age, y = pop, fill = gender), color = "black", linewidth = 0.25) +
#   geom_hline(yintercept = 0, linewidth = 1) +
#   labs(title = "Diverging bar chart") +
#   scale_y_continuous(limits = c(-400, 400)) +
#   scale_fill_viridis_d(option = "magma", begin = .2, end = .6, alpha = .8) +
#   coord_flip() +
#   theme_minimal() +
#   theme(
#     text = element_text(family = "siyuan"),
#     plot.title = element_text(size = 20, family = "siyuan"),
#     legend.direction = "horizontal",
#     legend.position = c(1, 1),
#     legend.justification = c(1, 1)
#   )

# library(tidyverse)
# library(showtext)

# showtext_auto()
# font_path <- "notes/fonts/SiYuanCN-Heavy.otf"
# font_add("siyuan", font_path)

# data <- read_csv("notes/data/StackedArea_Data.csv") 
# data <- data %>% mutate(Date = as.Date(Date)) %>% 
#   pivot_longer(
#     cols = -Date,
#     names_to = "Countries",
#     values_to = "Values"
#   )

# ggplot(data, aes(x = Date, y = Values)) +
#   geom_area(aes(fill = Countries), alpha = 1, position = "stack", color = "black") +
#   labs(title = "Stacked Plot") +
#   scale_fill_viridis_d() +
#   theme_minimal() +
#   theme(
#     text = element_text(family = "siyuan"),
#     plot.title = element_text(size = 25),
#     axis.title = element_text(hjust = 1, size = 13),
#     axis.text = element_text(size = 10)
#   ) 

# ggsave(filename = "notes/output_img/stacked_plot.png", plot = last_plot(), dpi = 90)

# library(tidyverse)
# library(SuppDists)
# findParams <- function(mu, sigma, skew, kurt) {
#   value <- .C("JohnsonMomentFitR", as.double(mu), as.double(sigma),
#               as.double(skew), as.double(kurt - 3), gamma = double(1),
#               delta = double(1), xi = double(1), lambda = double(1),
#               type = integer(1), PACKAGE = "SuppDists")
  
#   list(gamma = value$gamma, delta = value$delta,
#        xi = value$xi, lambda = value$lambda,
#        type = c("SN", "SL", "SU", "SB")[value$type])
# }

# # 均值为3，标准差为1的正态分布
# n <- rnorm(100,3,1)
# # Johnson分布的偏斜度2.2和峰度13
# s <- rJohnson(100, findParams(3, 1, 2., 13.1))
# # Johnson分布的偏斜度0和峰度20）
# k <- rJohnson(100, findParams(3, 1, 2.2, 20))
# # 两个峰的均值μ1，μ2分别为1.89和3.79，σ1 = σ2 =0.31
# mm <- rnorm(100, rep(c(2, 4), each = 50) * sqrt(0.9), sqrt(0.1))

# mydata <- data.frame(
#   Class = factor(rep(c("n", "s", "k", "mm"), each = 100),
#                  c("n", "s", "k", "mm")),
#   Value = c(n, s, k, mm)
# )

# write_csv(mydata, "bar_distribution.csv")



# library(tidyverse)
# set.seed(100)

# n <- rnorm(100, 3, 1)
# s <- rnorm(100, 2, 2)
# k <- rnorm(100, 4, 1)
# m <- rnorm(100, 5, 3)

# mydata <- data.frame(
#   Class = factor(rep(c("n", "s", "k", "m"), each = 100),
#                  c("n", "s", "k", "m")),
#   Value = c(n, s, k, m)
# )

# # 写入CSV文件
# write_csv(mydata, "plot/notes/data/bar_distribution.csv")


# library(tidyverse)
# library(showtext)

# showtext_auto()
# font_path <- "plot/notes/fonts/SiYuanCN-Heavy.otf"
# font_add("siyuan", font_path)
# data <- read.csv("plot/notes/data/bar_distribution.csv")

# ggplot(data, aes(x = Class, y = Value)) +
#   stat_summary(fun = mean, fun.args = list(mult = 1), geom = "bar", width = .7, color = "black", fill = "white", lwd = 1) +
#   geom_jitter(aes(fill = Class), position = position_jitter(0.2), shape = 21, size = 3) +
#   stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1), geom = "errorbar", width = .2, lwd = 1) +
#   labs(title = "Bar Distribution With Jitter Dots") +
#   theme_minimal() +
#   theme(
#     text = element_text(family = "siyuan"),
#     plot.title = element_text(size = 25), 
#     axis.text = element_text(size = 10),
#     axis.title = element_text(size = 12, hjust = 1),
#     legend.position = "none",
#   )


# library(tidyverse)
# library(showtext)

# showtext_auto()
# font_path <- "plot/notes/fonts/SiYuanCN-Heavy.otf"
# font_add("siyuan", font_path)

# data <- read.csv("plot/notes/data/DotPlots_Data.csv")
# data <- data %>% pivot_longer(cols = where(is.numeric), names_to = "Sex", values_to = "Value")

# ggplot(data, aes(x = Value, y = City)) +
#   geom_line(aes(group = City)) +
#   geom_point(aes(fill = Sex), color = "black", shape = 21, size = 3) +
#   labs(title = "Dumbbell plot") +
#   theme_minimal() +
#   theme(
#     text = element_text(family = "siyuan"),
#     plot.title = element_text(size = 25),
#     axis.title = element_text(hjust = 1, size = 12),
#     axis.text = element_text(size = 10)
#   )

# ggsave(filename = "plot/notes/output_img/dumbbell_plot.png", plot = last_plot(), dpi = 90)

# library(data.table)
# set.seed(1234)
# dat <- data.table(
#   date = seq(as.Date("1/01/2014", "%d/%m/%Y"),as.Date("31/12/2017", "%d/%m/%Y"),"days"),
#   ValueCol = runif(1461)
# )
# dat[, ValueCol := ValueCol + (strftime(date,"%u") %in% c(6,7) * runif(1) * 0.75), .I]
# dat[, ValueCol := ValueCol + (abs(as.numeric(strftime(date,"%m")) - 6.5)) * runif(1) * 0.75, .I]

# dat$Year<- as.integer(strftime(dat$date, '%Y'))   #年份
# dat$month <- as.integer(strftime(dat$date, '%m')) #月份
# dat$week<- as.integer(strftime(dat$date, '%W'))   #周数

# MonthLabels <- dat[,list(meanWkofYr = mean(week)), by = c('month') ]
# MonthLabels$month <-month.abb[MonthLabels$month]

# write_csv(dat, "plot/notes/data/Calendar_chart_Data.csv")

library(tidyverse)
library(ggTimeSeries)
library(RColorBrewer)
library(showtext)

showtext_auto()
font_path <- "plot/notes/fonts/SiYuanCN-Heavy.otf"
font_add("siyuan", font_path)

data <- read_csv("plot/notes/data/Calendar_chart_Data.csv")
MonthLabels <- data %>% group_by(month) %>% summarise(mean_week = mean(week))
MonthLabels$month_labels <- month.abb[1:12]

days <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
colormap <- brewer.pal(10, "RdYlBu")

ggplot(data, aes(date = date, fill = ValueCol)) +
  stat_calendar_heatmap() +
  facet_wrap(facets = "Year", nrow = 4, strip.position = "right") +
  scale_x_continuous(breaks = MonthLabels$mean_week, labels = MonthLabels$month_labels) +
  scale_y_continuous(breaks = seq(7, 1, by = -1), labels = days) +
  scale_fill_gradientn(colours = colormap) +
  theme_minimal() +
  theme(
    text = element_text(family = "siyuan"),
    strip.text = element_text(size = 12),
    axis.text = element_text(size = 10)
  )
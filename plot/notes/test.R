library(tidyverse)
mpg %>% 
  ggplot(aes(x = cty)) +
  geom_histogram(aes(y = after_stat(density)), fill = "steelblue") +
  theme_minimal()
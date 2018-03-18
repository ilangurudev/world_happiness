library(tidyverse)
library(mlbench)

smiley_data <- mlbench.smiley(3000, 0.1, 0.1)
smiley_data$x  %>% 
  as_tibble() %>% 
  rename(x = x4, y = V1) %>% 
  filter(!(between(x, -0.25, 0.25) & between(y, 0, 0.75))) %>% 
  ggplot(aes(x, y)) +
  geom_point(alpha = 0.5, size = 2) +
  theme_minimal()

ggsave("smiley.png", dpi = 1000)

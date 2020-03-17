## CODE ALL ADAPTED FROM https://peakmaximum.com/2019/07/11/recreating-lenore-tawney-s-1964-drawing-reflected-ray/

library(ggplot2)
library(readr)
library(dplyr)

# Raw data 
df <- read_csv('https://raw.githubusercontent.com/Twoy519/peakmaximum/master/data_assets/reflected_ray_data.csv')

# Theme blank 
theme_blank <- theme(axis.line=element_blank(),axis.text.x=element_blank(),
      axis.text.y=element_blank(),axis.ticks=element_blank(),
      axis.title.x=element_blank(),
      axis.title.y=element_blank(),legend.position="none",
      panel.background=element_blank(),panel.border=element_blank(),panel.grid.major=element_blank(),
      panel.grid.minor=element_blank(),plot.background=element_blank())

# Generate the plots
df %>%
  ggplot() +
  geom_segment(aes(x=x1, y=y1, xend=x2, yend=y2, color=color), alpha = 0.4) +
  scale_color_manual(values=c('black','black')) + theme_blank -> plt_all_black 

df %>%
  ggplot() +
  geom_segment(aes(x=x1, y=y1, xend=x2, yend=y2, color=color), alpha = 0.4) +
  scale_color_manual(values=c('black','red')) + theme_blank -> plt_all_red_black 

df %>%
  filter(color == 'dark') %>% 
  ggplot() +
  scale_color_manual(values=c('black','red')) + 
  geom_segment(aes(x=x1, y=y1, xend=x2, yend=y2, color=color), alpha = 0.4) + theme_blank -> plt_dark

df %>%
  filter(color == 'red') %>% 
  ggplot() +
  geom_segment(aes(x=x1, y=y1, xend=x2, yend=y2, color=color), alpha = 0.4) + theme_blank -> plt_red

# Save everything 
ggsave(plot = plt_all_black, filename = "plt_all_black.svg", width = 8, height = 10)
ggsave(plot = plt_all_red_black, filename = "plt_all_red_black.svg", width = 8, height = 10)
ggsave(plot = plt_dark, filename = "plt_dark.svg", width = 8, height = 10)
ggsave(plot = plt_red, filename = "plt_red.svg", width = 8, height = 10)
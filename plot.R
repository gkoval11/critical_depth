#import necessary libraries
library(tidyverse)
library(ggforce)


###Create graph using ggforce and geom_arc

#create dummy datasets with coordiantes for geom_segment
dfx <- data.frame(x1 = 5.8, x2 = 5.8, y1 = 10, y2 = 15)
dfy <- data.frame(x1 = 5.3, x2 = 11, y1 = 10)

#create the graph
ggplot() + 
  theme_classic() +
  geom_arc(aes(x0 = 10.3, y0 = 10, r = 5, start = 4.72-2*pi, end = 6.27-2*pi), size = 1) +
  #geom_segment(aes(x = x1, y = y1, xend = x2, yend = y2), data = dfx) + 
  geom_segment(aes(x = x1, y = y1, xend = x2, yend = y1), data = dfy) +
  annotate(geom = "text", x = 6.1, y = 14.25, label = "Phytoplankton Production", size = 5) + 
  #annotate(geom = "text", x = 5.5, y = 13.5, label = "Phytoplankton Respiration", size = 5, angle = '90') + 
  #annotate(geom = "text", x = 5.3, y = 15, label = "0", size = 5) + 
  #annotate(geom = "text", x = 10.5, y = 10.2, label = "Limit of Mixed Layer", size = 5) + 
  #annotate(geom = "text", x = 10, y = 15, label = 'surface', size = 5) + 
  #geom_rect(aes(xmin = 5.3, xmax = 5.8, ymin = 10, ymax = 15), fill = "red", color = NA, alpha = 0.3) +
  geom_hline(yintercept = 15)+
  #geom_hline(yintercept = 10, linetype = "longdash") + 
  ylim(10,15) +
  xlim(5.3,11) + 
  ylab("Depth") +
  ggtitle("Sverdrup's Critical Depth Hypothesis", subtitle = "surface") + 
  theme(axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title.x = element_blank(),
        axis.line.x = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 18),
        plot.subtitle = element_text(hjust = 0.01, size = 12),
        axis.line.y = element_line(arrow = grid::arrow(length = unit(0.3, "cm"), ends = "first")))


  
  

### This is my second.  I am learning how to create plots
### Created by: Caroline Solis
### Created on: 2023-07-02
###############################################

# Libraries-----------------------------
#install.packages("palmerpenguins")
library(palmerpenguins)
library(tidyverse)



# Load data----------------------------
glimpse(penguins)
ggplot(data=penguins)


# Functions----------------------------
ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species)) +
  geom_point()+
  labs(title = "Bill depth and length",
       subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
       x = "Bill depth (mm)", y = "Bill length (mm)",
       color = "Species",
       caption = "Source: Palmer Station LTER / palmerpenguins package")+
  scale_color_viridis_d()



# Data analysis------------------------

#aes() means aesthetics
#geom_xx means geometry


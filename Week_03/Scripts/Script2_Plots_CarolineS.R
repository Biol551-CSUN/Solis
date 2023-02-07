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
#Example 1
ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species,
                     shape = island)) +
  geom_point()+
  labs(title = "Bill depth and length",
       subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
       x = "Bill depth (mm)", y = "Bill length (mm)",
       color = "Species")+
  scale_color_viridis_d() #this works well for color_blind friendly


#Example 2
ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species,
                     size = body_mass_g,
                     alpha = flipper_length_mm
                     )) +
  geom_point()+
  scale_color_viridis_d() #this works well for color_blind friendly


#Example 3
ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species,
                     size = body_mass_g,
                     alpha = flipper_length_mm
       )) +
  geom_point()+
  scale_color_viridis_d()

      #inside aes = data
      #outside aes = settings


#Example: Mapping
ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     size = body_mass_g,
                     alpha = flipper_length_mm
       )) +
  geom_point()


#Example: Setting
ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm)) +
  geom_point(size = 2, alpha = 0.5)


#Example: Facet_grid
ggplot(penguins, 
       aes(x = bill_depth_mm,
           y = bill_length_mm))+
  geom_point()+
  facet_grid(species~sex) 

#Example: Facet_grid reversing x and y
ggplot(penguins, 
       aes(x = bill_depth_mm,
           y = bill_length_mm))+
  geom_point()+
  facet_grid(sex~species)

#Example: Facet_wrap
ggplot(penguins, aes(x = bill_depth_mm, y = bill_length_mm)) + 
  geom_point() +
  facet_wrap(~ species)

#Example: Facet_wrap with specific columns
ggplot(penguins, aes(x = bill_depth_mm, y = bill_length_mm)) + 
  geom_point() +
  facet_wrap(~ species, ncol=2) # make it two columns

  #Facet_grid(): 2D grid; rows ~ columns
  #Facet_wrap(): 1d ribbon wrapped according to numbers of rows and 
                  #columns specified or available plotting area

#Example: Facet with color
ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species,
       )) +
  geom_point()+
  scale_color_viridis_d()+
  facet_grid(species~sex)

#Example: Facet with color removing "guide" aka legend
ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species,
       )) +
  geom_point()+
  scale_color_viridis_d()+
  facet_grid(species~sex)+
  guides(color = FALSE)



# Data analysis------------------------

#aes() means aesthetics
#geom_xx means geometry




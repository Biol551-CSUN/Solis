### Group lab assignment
### Created by: Caroline Solis
### Created on: 2023-14-02
###############################################
#Write a script that:
  
#  1. calculates the mean and variance of body mass by 
      # species, island, and sex without any NAs

#  2. filters out (i.e. excludes) male penguins, then calculates the log body mass, 
      # then selects only the columns for species, island, sex, and log body mass, 
      # then use these data to make any plot. Make sure the plot has 
      # clean and clear labels and follows best practices. 
      # Save the plot in the correct output folder.

# Include both part 1 and part 2 in your script and 
      # push it to github in the appropriate folders.


# Libraries-----------------------------
library(palmerpenguins)
library(tidyverse)
library(dplyr)
library(beyonce)

# Load data----------------------------
head(penguins)

# Functions----------------------------

#calculate the mean and variance of body mass
penguins %>% 
  group_by(species, island, sex) %>% 
  drop_na(species, island, sex) %>%
  summarise(mean_body_mass = mean(body_mass_g, na.rm=TRUE),
            variance_body_mass = var(body_mass_g, na.rm=TRUE))

#filter out males and calc log body mass
penguins %>%
  filter(sex != "male") %>%
  mutate(log_mass = log(body_mass_g)) %>%
  select(species, island, sex, log_mass) %>%
  
  ggplot( 
    mapping = aes(x = species, 
                  y = log_mass,
                  group = species,
                  color = species)) +
  geom_point() + 
  geom_smooth(method = "lm") +
  labs(x = "Species", 
       y = "Log Body Mass (g)") +
  ggtitle("Log Body Mass in Penguins Grouped by Species") +
  scale_color_manual(values = beyonce_palette(101)) +
  theme_bw() +
  theme(axis.title = element_text(size = 20),
        plot.title = element_text(size = 15, hjust = 0.5, face = "bold")
  )

# Data analysis------------------------



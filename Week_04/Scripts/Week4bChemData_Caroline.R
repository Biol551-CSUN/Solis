### week 4b lecture: 
### Created by: Caroline Solis
### Created on: 2023-16-02
###############################################


# Libraries-----------------------------
library(tidyverse)
library(here)
library(beyonce)

# Load data----------------------------
ChemData<-read_csv(here("Week_04","data", "chemicaldata_maunalua.csv"))
View(ChemData)
glimpse(ChemData)

# Functions----------------------------

#Start from beginning and calculate summary statistics and export to csv
ChemData_clean <- ChemData %>%
  drop_na() %>% #filters out everything that is not a complete row
  separate(col = Tide_time, # choose the tide time col
           into = c("Tide","Time"), # separate it into two columns Tide and Time
           sep = "_") %>%
  filter(Waypoint >= 5) %>% # filter by Waypoint greater than or equal to 5
  pivot_longer(cols = Phosphate:percent_sgd,# pivot Phosphate to percent SGD cols
               names_to = "Variable", # the names of the new cols with all the column names
               values_to = "Value") %>% # names of the new column with all the values
  group_by(Zone, Temp_in, Salinity) %>% # group by zone temp and salinity
  summarise(mean_vals = mean(Value, na.rm = TRUE)) %>% #summarize all the values by getting the mean
  write_csv(here("Week_04", "Output", "summary_assignment_week4b_CarolineS.csv")) %>%#export as csv to the output folder
  
  ggplot(aes(x = mean_vals, 
             y = Salinity, 
             color = Zone)) + #create scatterplot
  geom_point(alpha = 0.5) + #adds transparency
  xlab("Mean Water Temperature") + #labels
  ylab("Salinity") +
  ggtitle("Mean Temperature vs. Salinity") + # title
  facet_wrap(~ Zone, scales = "free") + # plots by zone
  scale_color_manual(values = beyonce_palette(13)) #color palette






# Data analysis------------------------

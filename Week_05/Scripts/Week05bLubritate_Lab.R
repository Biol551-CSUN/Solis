### week 5b lab: lubritate
### Created by: Caroline Solis
### Created on: 2023-21-02
###############################################

# Libraries-----------------------------
library(tidyverse)
library(here)
library(lubridate)
library(ggthemes)

# Load data----------------------------
Cond_Data <- read_csv(here("Week_05", "Data", "CondData.csv")) # Load CondData
Depth_Data <- read_csv(here("Week_05", "Data", "DepthData.csv")) # Load DepthData

# Functions----------------------------
Cond_Data <- Cond_Data %>%  #assigns CondData
  mutate(date = mdy_hms(date), # changes character to POSIX variable
         date = round_date(date, "10 seconds"))  # rounds time to nearest 10 seconds

Depth_Data <- Depth_Data %>% # assigns DepthData
  mutate(date = ymd_hms(date)) # changes character to datetime format

Depth_Cond <- inner_join(Depth_Data,  
                           Cond_Data) %>%  # joins DepthData and CondData and drops NA values
  mutate(date = round_date(date, "1 minute")) %>% # rounds and averages dates by minute
  group_by(date) %>% # group by date
  summarise(mean_depth = mean(Depth, na.rm = TRUE), # calculate mean depth
            mean_temp = mean(Temperature, na.rm = TRUE), # calculate mean temp
            mean_salinity = mean(Salinity, na.rm = TRUE)) %>% # calculate mean salinity
  ggplot(aes(x= date,  # assigns date to x variable
             y = mean_temp)) +  # assigns mean temp to y variable
  geom_line(color = "black") + # gives line with color
  geom_point(size = 1, color = "maroon") + # gives points with size 1 and color 
  theme_classic() + # classic theme
  labs(x = "Time on January 15th, 2021", # x, y, and plot title labels
       y = "Mean Temperature",
       title = "Average Temperature by Time") +
  theme(panel.background = element_rect(fill= "lightblue"), # background beige
        panel.grid.major = element_line(color = "blue", # add dashed gray gridlines
                                        linetype = "dashed"))
Depth_Cond
ggsave(here("Week_05", "Output", "Jan15plot_5b_lab.png"), width = 7, height = 5) #saves and exports plot as a png

# Data analysis------------------------








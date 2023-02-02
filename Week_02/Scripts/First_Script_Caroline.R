### This is my first script.  I am learning how to import data
### Created by: Caroline Solis
### Created on: 2023-02-02
###############################################

# Libraries-----------------------------
#install.packages("here")
#install.packages("tidyverse")
library("here")
library("tidyverse")

# Load data----------------------------
WeightData <- read_csv(here("Week_02","Data","weightdata.csv"))


# Functions----------------------------



# Data analysis------------------------
head(WeightData)  # Looks at the top 6 lines of the dataframe
tail(WeightData) # Looks at the bottom 6 lines of the dataframe
View(WeightData) # opens a new window to look at the entire dataframe




### week 12b lab: forloops and purrr
### Created by: Caroline Solis
### Created on: 2023-25-04
###############################################
#Instructions:
#Each of these files is a timeseries of temperature and light data collected in 
#tide pools in Oregon by Jenn Fields. Your goal is to bring in all 4 files and calculate 
#the mean and standard deviation of both temperature (Temp.C) and light (Intensity.lux) 
#for each tide pool. Use both a for loop and map() functions in your script. 
#(Basically, do it twice). Due Tuesday at 1pm.


# Libraries-----------------------------
library(tidyverse)
library(here)


# Load data----------------------------

#Forloop:
  # point to the location on the computer of the folder
  HomePath<-here("Week_12", "data", "homework")
  # list all the files in that path with a specific pattern
  # you can use regex to be more specific if you are looking for certain patterns in filenames
  files <- dir(path = HomePath,pattern = ".csv") #looking for everything that has a .csv in the filename
  files

#Purrr:
  # point to the location on the computer of the folder
  HomePath<-here("Week_12", "data", "homework")
  files <- dir(path = HomePath,pattern = ".csv", full.names = TRUE)
  #save the entire path name
  files

# Functions----------------------------

#Forloop:
  # pre-allocate space
  # make an empty dataframe that has one row for each file and 5 columns
  home_data<-data.frame(matrix(nrow = length(files), ncol = 5))
  # give the dataframe column names
  colnames(home_data)<-c("filename","mean_temp", "mean_light","sd_temp", "sd_light") #create col names
  home_data
  
  raw_data<-read_csv(paste0(HomePath,"/",files[4])) # test by reading in files
  head(raw_data)
  
  
  for (i in 1:length(files)){ # loop over 1:4 the number of files by using i index
    raw_data<-read_csv(paste0(HomePath,"/",files[i]))
    #glimpse(raw_data)
    home_data$filename[i]<-files[i]
    home_data$mean_temp[i]<-mean(raw_data$Temp.C, na.rm =TRUE) #mean of temp
    home_data$mean_light[i]<-mean(raw_data$Intensity.lux, na.rm =TRUE) #mean of light
    home_data$sd_temp[i]<-sd(raw_data$Temp.C, na.rm =TRUE) #standard dev of temp
    home_data$sd_light[i]<-sd(raw_data$Intensity.lux, na.rm =TRUE) #standard dev of light
  } 
  home_data
write.csv(HomePath,here("data","homework","forloop_data"), row.names=FALSE)
  
# Purrr:
  pur_data<-files %>%
    set_names()%>% # set's the id of each list to the file name
    map_df(read_csv,.id = "filename") # map everything to a dataframe and put the id in a column called filename
  data
  
  #calculate means and standard deviation
  pur_data<-files %>%
    set_names()%>% # set's the id of each list to the file name
    map_df(read_csv,.id = "filename") %>% # map everything to a dataframe and put the id in a column called filename
    group_by(filename) %>%
    summarise(mean_temp = mean(Temp.C, na.rm = TRUE), #mean for temp
              mean_light = mean(Intensity.lux,na.rm = TRUE), #mean for light
              sd_temp = sd(Temp.C, na.rm = TRUE), #stand dev for temp
              sd_light = sd(Intensity.lux,na.rm = TRUE)) #stand dev for light
  pur_data
  
  
  

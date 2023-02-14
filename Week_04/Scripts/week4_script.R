### This is my third.  I am learning how to create better plots
### Created by: Caroline Solis
### Created on: 2023-07-02
###############################################




# Libraries-----------------------------
library(palmerpenguins)
library(tidyverse)

# Load data----------------------------
head(penguins)

filter(.data = penguins, sex == "female" )

# Functions----------------------------
filter(.data = penguins, sex == "female" )

#Select females that are also greater than 5000 g
filter(.data = penguins, sex == "female", body_mass_g >5000) 

#These two do the exact same thing
filter(.data = penguins, sex == "female", body_mass_g >5000)
filter(.data = penguins, sex == "female" & body_mass_g >5000) #preferred

#Penguins that were collected in either 2008 or 2009
filter(.data = penguins, year == 2008| year == 2009)
filter(.data = penguins, year %in% c("2008","2009"))


#Penguins that are not from the island Dream
filter(.data = penguins, island != "Dream")




#Penguins in the species Adelie and Gentoo
filter(.data = penguins, species == "Adelie" & species == "Gentoo") #there are no Gentoo so it outputs zero
filter(.data = penguins, species != "chinstrap")
filter(.data = penguins, species %in% c("Adelie", "Gentoo"))

#penguins between 3000 and 5000 g
filter(.data = penguins, 
       body_mass_g <5000,
       body_mass_g >3000)

#penguins in dream and biscoe
filter(.data = penguins,
       island %in% c("Dream","Biscoe"))

#MUTATE: Add a new column converting body mass in g to kg and save the new dataframe
data2<-mutate(.data = penguins, 
              body_mass_kg = body_mass_g/1000)
View(data2)

#Change multiple columns at once
data2<-mutate(.data = penguins, 
              body_mass_kg = body_mass_g/1000,  # convert mass to kg 
              bill_length_depth = bill_length_mm/bill_depth_mm) # calculate the ratio of bill length to depth



# Data analysis------------------------

#One = sets an argument in the function

#Two == reads as "is exactly equal to." 
  #It is a question that returns a TRUE or FALSE. Here, filter keeps every TRUE
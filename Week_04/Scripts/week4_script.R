### This is my 4th.  Dplyr stuff.
### Created by: Caroline Solis
### Created on: 2023-14-02
###############################################




# Libraries-----------------------------
library(palmerpenguins)
library(tidyverse)
library(dplyr)

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


#mutate with ifelse
data2<- mutate(.data = penguins,
               after_2008 = ifelse(year>2008, "After 2008", "Before 2008"))
View(data2)

#Exercise: Use mutate to create a new column to add flipper length and body mass together
length_mass <-mutate(.data = penguins, 
              flipper_length_mass = flipper_length_mm + body_mass_g)

#Exercise: Use mutate and ifelse to create a new column where body mass greater 
              #than 4000 is labeled as big and everything else is small
mass_greaterthan <- mutate(.data = penguins,
               bigger_4000 = ifelse(body_mass_g >4000, "big","small" ))


#using %>% aka "the pipe"
penguins %>% #use penguin dataframe
  filter(sex == "female") %>% #select females
  mutate(log_mass = log(body_mass_g)) #calculate log biomass

# Select function: use select() to select certain columns to remain in the dataframe
pengiuns %>%
  filter(sex == "female") %>%
  mutate(log_mass = log(body_mass_g)) %>%
  select(species, island, sex, log_mass)

#You can also use select() to rename columns.
    #Here, we are renaming species to have a capital S
penguins %>% # use penguin dataframe
  filter(sex == "female") %>% #select females
  mutate(log_mass = log(body_mass_g)) %>% #calculate log biomass
  select(Species = species, island, sex, log_mass)

#Summary table of data
#Calculate the mean flipper length (and exclude any NAs)
penguins %>%  
  summarize(mean_flipper = mean(flipper_length_mm, na.rm=TRUE)) #na.rm removes NAs

#calculate the mean and min
penguins %>% # 
  summarise(mean_flipper = mean(flipper_length_mm, na.rm=TRUE),
            min_flipper = min(flipper_length_mm, na.rm=TRUE))

#create a summary by group
    #mean and max bill length by island and species
penguins %>%
  group_by(island, species) %>%
  summarise(mean_bill_length = mean(bill_length_mm, na.rm = TRUE),
            max_bill_length = max(bill_length_mm, na.rm=TRUE))

#drop_na(): drops rows with NAs from a specific column
    #drop all the rows that are missing data on sex
penguins %>%
  drop_na(sex)

#drop all the rows that are missing data on sex calculate mean bill length by sex
penguins %>%
  drop_na(sex) %>%
  group_by(island, sex) %>%
  summarise(mean_bill_length = mean(bill_length_mm, na.rm = TRUE))

#pipe into ggplot: Drop NAs from sex, and then plot boxplots of flipper length by sex
penguins %>%
  drop_na(sex) %>%
  ggplot(aes(x = sex, y = flipper_length_mm)) +
  geom_boxplot()


# Data analysis------------------------

#One = sets an argument in the function

#Two == reads as "is exactly equal to." 
  #It is a question that returns a TRUE or FALSE. Here, filter keeps every TRUE

#https://dplyr.tidyverse.org/reference/mutate_all.html -> website to explain these:
#mutate_if()
#mutate_at()
#mutate_all()


#look into case.when()

#pipes are for data and plus is for more for ggplot


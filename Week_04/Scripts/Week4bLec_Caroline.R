### week 4b lecture: 
### Created by: Caroline Solis
### Created on: 2023-16-02
###############################################


# Libraries-----------------------------
library(tidyverse)
library(here)

# Load data----------------------------
ChemData<-read_csv(here("Week_04","data", "chemicaldata_maunalua.csv"))
View(ChemData)
glimpse(ChemData)

# Functions----------------------------

#another way to drop NAs
ChemData_clean <- ChemData %>%
  filter(complete.cases(.)) #filters out everything that is not a complete row

view(ChemData_clean)

#Separate function used
ChemData_clean <- ChemData %>%
  drop_na %>% #this filters all incomplete rows
  separate(col = Tide_time, #choose the tide time column
  into = c("Tide", "Time"), #separate it into two new columns named whatever you want
  sep = "_") #separate by "_"

head(ChemData_clean)

#If i want to keep the original column then add remove parameter
ChemData_clean <- ChemData %>%
  drop_na %>% #this filters all incomplete rows
  separate(col = Tide_time, #choose the tide time column
           into = c("Tide", "Time"), #separate it into two new columns named whatever you want
           sep = "_", #separate by "_"
           remove = FALSE)

#Using unite function:
ChemData_clean <- ChemData %>%
  drop_na %>% #this filters all incomplete rows
  separate(col = Tide_time, #choose the tide time column
           into = c("Tide", "Time"), #separate it into two new columns named whatever you want
           sep = "_", #separate by "_"
           remove = FALSE) %>% #keeps original tide_time column
  unite(col = "Site_Zone", #the name of the new column
        c(Site, Zone), #columns you want to combine
        sep = ".", #puts a "." in the middle of data from both columns
        remove = FALSE) #keeps original col
head(ChemData_clean)

#our data is wide so we want to change it to long:
ChemData_long <- ChemData_clean %>%
  pivot_longer(cols = Temp_in:percent_sgd, #cols range you want to pivot
               names_to = "Variables", #names of the new cols with all the col names
               values_to = "Values") #names of the new col with all the values
View(ChemData_long)


#we can calculate the mean and variance for all variables with long dataset:
ChemData_long %>%
  group_by(Variables, Site) %>% #group by everything we want
  summarise(Param_means = mean(Values, na.rm = TRUE), #get mean
            Param_vars = var(Values, na.rm = TRUE)) #get variance

#Practice problem: calc mean, variance, standard deviation 
                    #for all variables by site, zone, and tide
                    
ChemData_long %>%
  group_by(Site, Zone, Tide) %>%
  summarise(Param_means = mean(Values, na.rm = TRUE),
            Param_vars = var(Values, na.rm = TRUE),
            Param_sd = sd(Values, na.rm = TRUE))

#create boxplots by site using facet_wrap
ChemData_long %>%
  ggplot(aes(x = Site, y = Values))+
  geom_boxplot()+
  facet_wrap(~Variables)

#create boxplots: fix the axes
ChemData_long %>%
  ggplot(aes(x = Site, y = Values))+ 
  geom_boxplot()+ 
  facet_wrap(~Variables, scales = "free")


#To go back to wide data from long format
ChemData_wide<-ChemData_long %>%
  pivot_wider(names_from = Variables, # column with the names for the new columns
              values_from = Values) # column with the values
View(ChemData_wide)

#Start from beginning and calculate summary statistics and export to csv
ChemData_clean<-ChemData %>%
  drop_na() %>% #filters out everything that is not a complete row
  separate(col = Tide_time, # choose the tide time col
         into = c("Tide","Time"), # separate it into two columns Tide and time
         sep = "_", # separate by _
         remove = FALSE) %>%
  pivot_longer(cols = Temp_in:percent_sgd, # the cols you want to pivot. This says select the temp to percent SGD cols
               names_to = "Variables", # the names of the new cols with all the column names
               values_to = "Values") %>% # names of the new column with all the values
  group_by(Variables, Site, Time) %>%
  summarise(mean_vals = mean(Values, na.rm = TRUE)) %>%
  pivot_wider(names_from = Variables, #convert back to wide
              values_from = mean_vals) %>%
  write_csv(here("Week_04", "Output", "summary.csv")) #export as csv to the output folder


View(ChemData_clean)


# Data analysis------------------------

#Separate function cheat sheet
#separate(
# data = [data frame you are using],
#  col = [column that you want to separate],
#  into = [name of the new columns],
#  sep = [what are you separating by?])

#Review:
#wide data: one observation per row and all different variables are columns
#long data: one unique measurement per row and all of the info about that meausrement in the same row

#wide to long: pivot_longer()
#long to wide: pivot_wider()





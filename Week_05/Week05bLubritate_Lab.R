### week 5b lab: lubritate
### Created by: Caroline Solis
### Created on: 2023-21-02
###############################################

# Libraries-----------------------------
install.packages("lubridate") # package to deal with dates and times
library(tidyverse)
library(here)
library(lubridate)
# Load data----------------------------

# Functions----------------------------
now() #what time is it now?
now(tzone = "EST") # what time is it on the east coast
now(tzone = "GMT") # what time in GMT
today()
today(tzone = "GMT")
am(now()) # is it morning?
leap_year(now()) # is it a leap year?
mdy("02/24/2021")
dmy("24/02/2021")
ymd("2021-02-24")

ymd_hms("2021-02-24 10:22:20 PM")
mdy_hms("02/24/2021 22:22:20")
mdy_hm("February 24 2021 10:22 PM")

# make a character string
datetimes<-c("02/24/2021 22:22:20",
             "02/25/2021 11:21:10",
             "02/26/2021 8:01:52")

# make a character string
datetimes<-c("02/24/2021 22:22:20", 
             "02/25/2021 11:21:10", 
             "02/26/2021 8:01:52") 

# convert to datetimes
datetimes <- mdy_hms(datetimes)

# convert to datetimes
datetimes <- mdy_hms(datetimes) 
month(datetimes)

month(datetimes, label = TRUE)


month(datetimes, label = TRUE, abbr = FALSE) #extract the months from the character string and state the month name
day(datetimes) #extract day
wday(datetimes, label = TRUE) #extract day of the week

hour(datetimes) #extract hour
minute(datetimes) # extract minute
second(datetimes) # extract second

# lets add 4 hours to all the datetimes

datetimes + hours(4) #adds 4 hours

datetimes + days(2) # this adds 2 days

round_date(datetimes, "minute") #round to nearest minute

round_date(datetimes, "5 mins") # round to nearest 5 minute

# Using CondData and converting the data column to a datetime
# We do this to have R treat this column as dates rather than just a character

glimpse(CondData)
view(CondData)

CondData %>%
  mutate(Date = mdy_hm(Date))



# Data analysis------------------------

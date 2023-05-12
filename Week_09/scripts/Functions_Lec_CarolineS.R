### week 5b lecture: lubritate
### Created by: Caroline Solis
### Created on: 2023-21-02
###############################################

# Libraries-----------------------------
#install.packages("tidyverse")
#install.packages("PNWColors")
library("tidyverse")
library(palmerpenguins)
library(PNWColors) # for the PNW color palette 

# Load data----------------------------

df <- tibble::tibble(
  a = rnorm(10), #draws 10 random values from a normal distribution
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

head(df)

# Functions----------------------------

#Rescale every column individually
df <- df %>%
  mutate(a = (a-min(a, na.rm = TRUE))/(max(a, na.rm = TRUE)-min(a, na.rm = TRUE)),
         b = (b-min(b, na.rm = TRUE))/(max(b, na.rm = TRUE)-min(b, na.rm = TRUE)),
         c = (c-min(c, na.rm = TRUE))/(max(c, na.rm = TRUE)-min(c, na.rm = TRUE)),
         d = (d-min(d, na.rm = TRUE))/(max(d, na.rm = TRUE)-min(d, na.rm = TRUE)))

#writing a function specifically for this
rescale01 <- function(x) {
  value<-(x-min(x, na.rm = TRUE))/(max(x, na.rm = TRUE)-min(x, na.rm = TRUE))
  return(value)
}

#return tells us what values we want returned when you run the function
rescale01 <- function(x) {
  value<-(x-min(x, na.rm = TRUE))/(max(x, na.rm = TRUE)-min(x, na.rm = TRUE))
  return(value)
}

  # example of making a function:
 
 #calculation for F to C:
  temp_C <- (temp_F - 32) * 5 / 9
  
  #step 1: name the function
  fahrenheit_to_celsius <- function() {
  }
  #step 2: put in the equeation
  fahrenheit_to_celsius <- function() { 
    temp_C <- (temp_F - 32) * 5 / 9
  }
  #step 3:Decide what the arguments are
  fahrenheit_to_celsius <- function(temp_F) {
    temp_C <- (temp_F - 32) * 5 / 9 
  }
  #Step 4: Decide what is being returned
  fahrenheit_to_celsius <- function(temp_F) { 
    temp_C <- (temp_F - 32) * 5 / 9 
    return(temp_C)
  }
  #Step 5: Test it
  fahrenheit_to_celsius(32)
  
  
  #think, pair, share:
  #write a fucntion to convert celcius to kelvin:
  Temp_K <- (temp_C + 273.15)
  
  TempC_to_TempK <- function(temp_C) {
    Temp_K <- (temp_C + 273.15)
    return(Temp_K)
  }
    
 #Making plots into functions
  pal<-pnw_palette("Lake",3, type = "discrete") # my color palette 
  ggplot(penguins, aes(x = body_mass_g, y = bill_length_mm, color = island))+
    geom_point()+
    geom_smooth(method = "lm")+ # add a linear model
    scale_color_manual("Island", values=pal)+   # use pretty colors and change the legend title
    theme_bw()
  
    #what can we change about this to make more versatile?
    myplot<-function(){
      pal<-pnw_palette("Lake",3, type = "discrete") # my color palette 
      ggplot(penguins, aes(x = body_mass_g, y = bill_length_mm, color = island))+
        geom_point()+
        geom_smooth(method = "lm")+ # add a linear model
        scale_color_manual("Island", values=pal)+   # use pretty colors and change the legend title
        theme_bw()
      }
      #here is the updated version with broad elements:
      myplot<-function(data, x, y){
        pal<-pnw_palette("Lake",3, type = "discrete") # my color palette 
        ggplot(data, aes(x = x, y =y , color = island))+
          geom_point()+
          geom_smooth(method = "lm")+ # add a linear model
          scale_color_manual("Island", values=pal)+   # use pretty colors and change the legend title
          theme_bw()
      }
      
      #test it out (there is an error in this):
      myplot(data = penguins, x = body_mass_g, y = bill_length_mm)
      
      #to fix this use curly curly brackets:
      myplot<-function(data, x, y){ 
        pal<-pnw_palette("Lake",3, type = "discrete") # my color palette 
        ggplot(data, aes(x = {{x}}, y = {{y}} , color = island))+
          geom_point()+
          geom_smooth(method = "lm")+ # add a linear model
          scale_color_manual("Island", values=pal)+   # use pretty colors and change the legend title
          theme_bw()
      }
      
      #now try again and it should work after adding curly curly:
      myplot(data = penguins, x = body_mass_g, y = bill_length_mm)
      myplot(data = penguins, x = body_mass_g, y = flipper_length_mm)
     
      #adding defaults: in the function you can add the default dataset so you dont have to write it in the rest of the code
      myplot<-function(data = penguins, x, y){
        pal<-pnw_palette("Lake",3, type = "discrete") # my color palette 
        ggplot(data, aes(x = {{x}}, y = {{y}} , color = island))+
          geom_point()+
          geom_smooth(method = "lm")+ # add a linear model
          scale_color_manual("Island", values=pal)+   # use pretty colors and change the legend title
          theme_bw()
      }
      # test it out
      myplot(x = body_mass_g, y = flipper_length_mm)
    
      #you can add layers to the plot with "+":
      myplot(x = body_mass_g, y = flipper_length_mm)+
        labs(x = "Body mass (g)",
             y = "Flipper length (mm)")
      
        #adding an if-else statement:
        a <- 4
        b <- 5
        if (a > b) { # my question
          f <- 20 # if it is true give me answer 1
        } else { # else give me answer 2
          f <- 10
        }
        
        #add a new argument for lines and make the default TRUE
        myplot<-function(data = penguins, x, y ,lines=TRUE ){ # add new argument for lines
          pal<-pnw_palette("Lake",3, type = "discrete") # my color palette 
          ggplot(data, aes(x = {{x}}, y = {{y}} , color = island))+
            geom_point()+
            geom_smooth(method = "lm")+ # add a linear model
            scale_color_manual("Island", values=pal)+   # use pretty colors and change the legend title
            theme_bw()
        }
        
        #here we will add the if-else statement so it will plot with or without lines
        myplot<-function(data = penguins, x, y, lines=TRUE ){ # add new argument for lines
          pal<-pnw_palette("Lake",3, type = "discrete") # my color palette 
          if(lines==TRUE){
            ggplot(data, aes(x = {{x}}, y = {{y}} , color = island))+
              geom_point()+
              geom_smooth(method = "lm")+ # add a linear model
              scale_color_manual("Island", values=pal)+   # use pretty colors and change the legend title
              theme_bw()
          }
          else{
            ggplot(data, aes(x = {{x}}, y = {{y}} , color = island))+
              geom_point()+
              scale_color_manual("Island", values=pal)+   # use pretty colors and change the legend title
              theme_bw()
          }
        }
        
        #test with lines:
        myplot(x = body_mass_g, y = flipper_length_mm)
        myplot(x = body_mass_g, y = flipper_length_mm, lines = FALSE)
        
        
        
      
# Analysis ----------------------------

#There are three key steps to creating a new function:
  
#  You need to pick a name for the function. Here I’ve used rescale01 because this function rescales a vector to lie between 0 and 1.

#You list the inputs, or arguments, to the function inside function. Here we have just one argument. If we had more the call would look like function(x, y, z).

#You place the code you have developed in body of the function, a { block that immediately follows function(...).

#return tells us what values we want returned when you run the function
      

    #anytime you are calling a column name from a dataframe use curly-curly bracket "{{}}"      

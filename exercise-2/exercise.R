# Exercise 2: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1

# Install devtools package: allows installations from GitHub
install.packages('devtools')
install.packages('dplyr')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package

library(fueleconomy)
library(dplyr)

# You should have have access to the `vehicles` data.frame

View(vehicles)

# Create a data.frame of vehicles from 1997

cars.1997 <- filter(vehicles,year==1997)

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame

unique(cars.1997$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city

two.wheel.20mpg <- filter(vehicles, drive == '2-Wheel Drive', cty > 20) 

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?

worst.hwympg.all <- filter(two.wheel.20mpg, min(hwy))
worst.hwympg.all
worst.hwympg <- select(worst.hwympg.all, id)
worst.hwympg
# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year

MakeYearFilterFunction <- function(input.make, input.year) {
  
  filtered <- filter(vehicles, make == input.make, year == input.year)
  solution <- filter(filtered, hwy == max(hwy))
                     
    return(solution)
  
}
# What was the most efficient honda model of 1995?
MakeYearFilterFunction('Honda', 1995)


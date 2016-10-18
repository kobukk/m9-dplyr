# Exercise 1: Data Frame Practice

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
 
require(fueleconomy)
library(fueleconomy)

# You should have have access to the `vehicles` data.frame
View(vehicles)


# Create a data.frame of vehicles from 1997

cars.97 <- vehicles[vehicles$year == 1997,]

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame

unique(cars.97$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city

two.wheel.more.than.20mpg <- vehicles[vehicles$drive == '2-Wheel Drive' & vehicles$cty > 20,]


# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?

worst.hwy.mpg <- two.wheel.more.than.20mpg$id[two.wheel.more.than.20mpg$hwy == min(two.wheel.more.than.20mpg$hwy)]
worst.hwy.mpg

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year

Most.MGP.Year.Make <- function (make, year){
  
  cars.in.category <- vehicles[vehicles$make == make & vehicles$year == year,]
  max.mpg.car <- cars.in.category[cars.in.category$hwy == max(cars.in.category$hwy),]
  return(max.mpg.car)
}

# What was the most efficient honda model of 1995?

Most.MGP.Year.Make('Honda', 1995)

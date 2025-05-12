# Randomly samples k vectors from a distribution of initial conditions and parameters
# for the model and then saves these
# 
# Created by: Peter S. Hovmand May 4, 2025
# Revised by: 

library(readr)
Parms <- read_csv("Parms_default.csv")

# set the number of vectors to randomly sample
k<-3

# create an empty data frame
tmp <- NULL

# create k rows of parameters that are randomly sampled from +/- 0.5 from 
# a uniform distribution
for (i in 1:k) {
  multiplier <- runif(length(Parms), .5, 1.5)
  tmp<-rbind(tmp, Parms*multiplier)
}

# save file to study2.csv
write_csv(tmp, file="study2.csv")



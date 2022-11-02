# Removes all variables stored previously
rm(list = ls())

# Import libraries
library(Hmisc)

data <- read.csv("~/R/COVID/Covid_R/COVID19_line_list_data.csv")

# Hmisc to describe the data
describe(data)

# Clean up the dataset for consistency
data$death_dummy <- as.integer(data$death != 0)

# Death Rate
sum(data$death_dummy) / nrow(data)

# AGE Claim: People who die are older
dead = subset(data, death_dummy == 1)
alive = subset(data, death_dummy == 0)
mean(dead$age, na.rm = TRUE)
mean(alive$age, na.rm = TRUE)

# Is this statistically significant?
t.test(alive$age, dead$age, alternative="two.sided", conf.level = 0.99)
 
# Normally, if p-value < 0.05, we reject null hypothesis. Here, p-value ~ 0, so we reject the null hypothesis and conclude that this is statistically significant

# GENDER Claim: Gender has no effect
men = subset(data, gender == "male")
women = subset(data, gender == "female")
mean(men$death_dummy, na.rm = TRUE) #8.5%!
mean(women$death_dummy, na.rm = TRUE) #3.7%

# Is this statistically significant?
t.test(men$death_dummy, women$death_dummy, alternative="two.sided", conf.level = 0.99)
# 99% confidence: men have from 0.8% to 8.8% higher chance of dying. Here, p-value = 0.002 < 0.05, so this is statistically significant.


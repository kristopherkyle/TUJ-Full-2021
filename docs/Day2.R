# Day 2: Getting Started with Data Analysis

#First, we will load important libraries:
#install.packages("ggplot2")
library(ggplot2) #visualizations

#Second, we will load our data spreadsheet
cor_data <- read.csv("ICNALE_500_Analyzed_2.csv", header = TRUE)

#Third, we will get descriptive statistics for the dataset:
summary(cor_data)

#Fourth, we will create a scatter plot of VST X mattr50_aw_TAALED
ggplot(cor_data, aes(x = mattr50_aw_TAALED , y= VST  )) +
  geom_point()

#Fifth, we will add a line of best fit and a LOESS line
ggplot(cor_data, aes(x = mattr50_aw_TAALED , y= VST  )) +
  geom_point() +
  geom_smooth(method = "loess",color = "red") + #this is a line of best fit based on a moving average
  geom_smooth(method = "lm") #this is a line of best fit based on the enture dataset

#Sixth, we will run a correlation between our two variables of interest
cor.test(cor_data$mattr50_aw_TAALED,cor_data$VST)

#Seventh, we will conduct a linear regression, wherein we predict VST scores using MATTR:
model1 <- lm(VST ~ mattr50_aw_TAALED, data = cor_data)
summary(model1)

#Using tidyverse to explore a dataset 
#Setting up environment
#install.packages() and library() to install and load tidyverse respectively

install.packages("tidyverse")
library(tidyverse)

#uploading dataset
population <- read_csv("world_population.csv")

head(population)

#Use colnames() to see names of the columns in your dataset
colnames(population)

#Data cleaning
#Use the rename() to rename the columns '2022 Population', '2020 Population' and '2015 Population'
population_2 <- population %>%
  rename("population_2022" = "2022 Population", "population_2020" = "2020 Population", "population_2015" = "2015 Population", "Country" = "Country/Territory")

head(population_2)

#Manipulate the data to display only the population of African countries in 2022 using the select() and filter()
oceania_countries <- select(population_2, Continent, Country, population_2022) %>%
  filter(Continent == "Oceania", population_2022 >= "1000000")

View(oceania_countries)

#Organizing data
populous_nations <- oceania_countries %>%
  arrange(desc(population_2022))
head(populous_nations)

#Plotting dataset
#To achieve great visualization, you use the gglot() function
#Let’s make a plot that will reveal Nigeria's population growth from 2015 to 2022

New_Zealand <- population_2 %>%
  select(Country, population_2022, population_2020, population_2015) %>%
  filter(Country == "New Zealand")
head(New_Zealand)

population_n <- c(5185288,5061133,4590590)
year <- c(2022, 2020, 2015)
NewZealand_population <- data.frame(population_n, year)
View(NewZealand_population)

ggplot(data=NewZealand_population) +
  geom_smooth(mapping = aes(x = year, y = population_n)) +
  labs( title = "New Zealand", subtitle = "The Population Growth of New Zealand from 2015 to 2022")



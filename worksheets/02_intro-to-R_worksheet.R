# We are working with a version of the gapminder dataset
# you can download the dataset from here: "https://github.com/ArunFrey/intro-to-R/blob/main/data/gapminder_df_edit.csv"
# save it in your project folder. 

## Read the data
gapminder_df <- read.csv("")

### Exercise 2 - Getting a sense of the data
## How many countries are there in the gapminder dataset?

## What years are in the dataset? 

## Which countries feature most (and least) often in the data?
## Hint: (?table)

### Exercise 3 - Inspecting our data of interest
## How many missing values are there for the 'year' variable?

## How many missing values are there for the 'lifeExp' variable?

## Which countries seem to be affected by the missingness in the data?

## lifeExp has some countries with missingness. Save these countries in a vector called countries_na

## We can actually use this that vector to create a new dataset including 
## only those countries with missing values:
gapminder_na <- gapminder_df[gapminder_df$country %in% countries_na, ]

### Exercise 4 - Inspecting missingness in our data

## Use gapminder_na to plot life expectancy against year. Notice the gaps in the data? 
# Hint: Use the argument "type = "b"", which makes the plot look nicer
plot(gapminder_na$year, gapminder_na$lifeExp, type = "b")

# Base R is terrible for plotting. Most people prefer to use the ggplot library 
library(ggplot2) # don't forget to install it prior to the first use
ggplot(gapminder_na, aes(x = year, y = lifeExp, group = country, color = country)) + 
  geom_point() + 
  geom_line()

# We can see that there is plenty of missingness: some countries have missing data at different points in time

# Let's try to address this missing data in a number of ways

### Exercise 5 - Imputing and inspecting the data using the mean

# Make a copy of the data
gapminder_df1 <- gapminder_na

# Calculate the overall mean of life expectancy

# Impute the missing values with the overall mean
gapminder_df1[is.na(gapminder_df1$lifeExp), "lifeExp"] <-
  
# Check how the missing countries look like now
ggplot(gapminder_df1, aes(x = year, y = lifeExp, group = country, color = country)) + 
  geom_point() + 
  geom_line()

# BONUS QUESTION: Is this a good way to impute missing values? What might be a better way? 


### Exercise 6: Using ggplot
# Hint: If you don't know how to proceed, check the documentation for ggplot at ?ggplot

## Make a scatterplot relating the association between 'lifeExp' and 'pop', using the entire dataset

## Make a scatterplot relating the association between 'lifeExp' and 'gdpPercap', where the size of the point indicates a countries population





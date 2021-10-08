### Freestyle working session (Day 2)
## Using the gapminder dataset

### Exercise 1 - Setting up the data
## Download the data from the following url:

## Check your current directory (tip: getwd()) and make sure you have a folder
## inside this directory called 'data' and put the data in there and rename it
## 'gapminder_df_day2.csv'

## Read the data
data <- read.csv("/Users/markverhagen/Downloads/gapminder_df_edit.csv")

### Exercise 2 - Getting a sense of the data
## How many countries are there in the gapminder dataset?
length(unique(df$country))

## What range of years is in the dataset?
range(df$year)
unique(df$year)

## Which countries feature most (and least) often in the data?
table(df$country)

### Exercise 3 - Inspecting our data of interest
## How much missing values are there for the 'year' variable?
mean(is.na(df$year))

## How much missing values are there for the 'lifeExp' variable?
sum(is.na(df[, "lifeExp"]))

## Which countries seem to be affected by the missingness in the data?
unique(df[is.na(df$lifeExp) , "country"])

## Save these countries in a vector
countries <- unique(df[is.na(df$lifeExp) , "country"])

### Exercise 4 - Inspecting the data
## Install the "ggplot2" library
install.packages("ggplot2")

## Make a plot (with this code snippet, don't forget to load the library!)
## Note that the snippet uses the data, as well as the vector of countries
## we defined above
library(ggplot2)

ggplot(df[df$country %in% countries, ]) +
  geom_point(aes(y = lifeExp, x = year, color = country)) +
  facet_wrap(~country)

## Turn the snippet above into a function taking the data and a list of countries
## to visualize
plot_countries <- function(df, country_list) {
  return(
    ggplot(df[df$country %in% country_list, ]) +
           geom_point(aes(y = lifeExp, x = year, color = country)) +
           facet_wrap(~country)
         )
}

## Visualize the data for the countries with the missing data
plot_countries(df, country_list = countries)

### Exercise 5 - Imputing and inspecting the data using the mean

## Make a copy of the dataframe and impute the missing lifeExp variables with
## the overall mean

# Make a copy
df2 <- df

# Calculate the overall mean
mean_life <- mean(df2$lifeExp, na.rm=T)

# Impute the missing values with the overall mean
df2[is.na(df2$lifeExp), "lifeExp"] <- mean_life

# Check how the missing countries look like now
plot_countries(df2, countries)

### Exercise 6 - Imputing and inspecting the data using the yearly mean
## Make a copy of the dataframe and imputate the missing
## values of the lieExp variable using the yearly mean
df3 <- df

## Make a table containing the mean for each year
mean_per_year <- aggregate(df3$lifeExp, by = list(df$year), mean, na.rm=T)

# Merge the yearly means to the original data

# Replace the missing lifeExp variable using the yearly means
df3 <- merge(df3, mean_per_year, by.x = "year", by.y = "Group.1")

df3[is.na(df3$lifeExp), "lifeExp"] <- df3[is.na(df3$lifeExp), "x"]

# Inspect the results
plot_countries(df3, country_list = countries)

### Exercise 7 - Imputing and inspecting the data using the country mean
## Repeat the imputation but using the country specific mean

# Calculate the mean per country (tip: use the aggregate function, ?aggregate)


# Make a copy of the dataframe for imputation with the country meana


# Merge the country means to the original data

  
# Replace the missing values of lifeExp with the country mean


# Inspect the results


### Exercise 8 - Exploring the imputed dataset

## Make a plot showing the development of lifeExpectancy over time
## tip: ?plot


## Replace the scatters by lines using 'type = "lines"'


## Make a lineplot showing the development of lifeExpectancy in Africa only


## Make a lineplot showing the development of lifeExpectancy in Europe only


## Make a scatterplot relating the association between 'lifeExp' and 'pop'
## for the year 2007


## Make a scatterplot relating the association between 'lifeExp' and 'gdpPercap'
## for the year 2017


## Do this for Africa and Europe separately

  
## BONUS QUESTION: which country has had the largest rate of growth in lifeExp?


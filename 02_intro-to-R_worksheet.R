# gapminder_df <- read.csv("./data/gapminder_df.csv")
# countries = c("Poland", "Eritrea", "Myanamar", "Nigeria", "Canada")
# values <- gapminder_df[gapminder_df$country %in% countries, "lifeExp"]
# gapminder_df[gapminder_df$country %in% countries, "lifeExp"][sample(length(values), 10)] <- NA
# write.csv(gapminder_df, "./data/gapminder_df_edit.csv")

# setwd("/Users/markverhagen/Dropbox/Academic Work/Teaching/intro-to-R/")

### Freestyle working session (Day 2)
## Using the gapminder dataset

### Exercise 1 - Setting up the data
## Download the data from the following url:

## Check your current directory (tip: getwd()) and make sure you have a folder
## inside this directory called 'data' and put the data in there and rename it
## 'gapminder_df_day2.csv'
getwd()

## Read the data
gapminder_df <- read.csv("data/gapminder_df_day2.csv")

### Exercise 2 - Getting a sense of the data
## How many countries are there in the gapminder dataset?
length(unique(gapminder_df$country))

## What range of years is in the dataset?
unique(gapminder_df$year)

## Which countries feature most (and least) often in the data?
## Hint: (?table)
table(gapminder_df$country)

### Exercise 3 - Inspecting our data of interest
## How much missing values are there for the 'year' variable?
sum(is.na(gapminder_df$lifeExp))

## How much missing values are there for the 'lifeExp' variable?
sum(is.na(gapminder_df$lifeExp))

## Which countries seem to be affected by the missingness in the data?
unique(gapminder_df$country[is.na(gapminder_df$lifeExp)])

## Save these countries in a vector
countries <- unique(gapminder_df$country[is.na(gapminder_df$lifeExp)])

### Exercise 4 - Inspecting the data
## Install the ggplot2 library
install.packages("ggplot2")

## Make a plot (with this code snippet, don't forget to load the library!)
## Note that the snippet uses the data, as well as the vector of countries
## we defined above
library(ggplot2)
ggplot(gapminder_df[gapminder_df$country %in% countries, ]) +
    geom_point(aes(y = lifeExp, x = year, color = country)) +
    facet_wrap(~country)

## Turn the snippet above into a function taking the data and a list of countries
## to visualize
plot_countries <- function(df, c_list) {
    ggplot(df[df$country %in% c_list, ]) +
        geom_point(aes(y = lifeExp, x = year, color = country)) +
        facet_wrap(~country)
}

## Visualize the data for the countries with the missing data
plot_countries(gapminder_df, countries)

### Exercise 5 - Imputing and inspecting the data using the mean

## Make a copy of the dataframe and impute the missing lifeExp variables with
## the overall mean

# Make a copy
gapminder_df1 <- gapminder_df
# Calculate the overall mean
mean <- mean(gapminder_df1$lifeExp, na.rm = T)
# Impute the missing values with the overall mean
gapminder_df1[is.na(gapminder_df1$lifeExp), "lifeExp"] <- mean
# Check how the missing countries look like now
plot_countries(gapminder_df1, countries)

### Exercise 6 - Imputing and inspecting the data using the yearly mean
## Make a copy of the dataframe and imputate the missing
## values of the lieExp variable using the yearly mean

## Make a table containing the mean for each year
## (tip: ?aggregate)
means_per_year <- aggregate(gapminder_df$lifeExp,
                            by = list(gapminder_df$year),
                            mean, na.rm = T
)

# Make a copy of the original dataset
gapminder_df2 <- gapminder_df
# Merge the yearly means to the original data
gapminder_df2 <- merge(gapminder_df2, means_per_year,
    by.x = "year", by.y = "Group.1"
)
# Replace the missing lifeExp variable using the yearly means
gapminder_df2[is.na(gapminder_df2$lifeExp), "lifeExp"] <-
    gapminder_df2[is.na(gapminder_df2$lifeExp), "x"]
# Inspect the results
plot_countries(gapminder_df2, countries)

### Exercise 7 - Imputing and inspecting the data using the country mean
## Repeat the imputation but using the country specific mean

# Calculate the mean per country (tip: use the aggregate function, ?aggregate)
means_per_year <- aggregate(gapminder_df$lifeExp,
    by = list(gapminder_df$country),
    mean, na.rm = T
)

# Make a copy of the dataframe for imputation with the country meana
gapminder_df3 <- gapminder_df

# Merge the country means to the original data
gapminder_df3 <- merge(gapminder_df3, means_per_year,
    by.x = "country", by.y = "Group.1"
)

# Replace the missing values of lifeExp with the country mean
gapminder_df3[is.na(gapminder_df3$lifeExp), "lifeExp"] <-
    gapminder_df3[is.na(gapminder_df3$lifeExp), "x"]

# Inspect the results
plot_countries(gapminder_df3, countries)

### Exercise 8 - Exploring the imputed dataset

## Make a plot showing the development of lifeExpectancy over time
## tip: ?plot
plot(gapminder_df3$year, gapminder_df3$lifeExp)

## Replace the scatters by lines using 'type = "lines"'
plot(gapminder_df3$year, gapminder_df3$lifeExp, type = "lines")

## Make a lineplot showing the development of lifeExpectancy in Africa only
africa_df <- gapminder_df3[gapminder_df3$continent == "Africa", ]
plot(africa_df$year, africa_df$lifeExp, type = 'lines')

## Make a lineplot showing the development of lifeExpectancy in Europe only
europe_df <- gapminder_df3[gapminder_df3$continent == "Europe", ]
plot(europe_df$year, europe_df$lifeExp, type = 'lines')

## Make a scatterplot relating the association between 'lifeExp' and 'pop'

## Make a scatterplot relating the association between 'lifeExp' and 'gdpPercap'



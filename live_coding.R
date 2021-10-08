x <- c(1:50)
y <- 25 > x
y
# 4. Create the vector c(0, 5, 10, 15) in two ways: using c() and using seq().

c(0, 5, 10, 15)
?seq
seq(from = 0, to = 15, by = 5)

my_name <- c("Hello", "my", "name", "is")
my_name2 <- c(my_name, "Arun")
my_name

?sort
sort(c(1,3,4, 2), decreasing = TRUE)

age <- c(22, 24,25, 25, 22, 21, 28, 23, 24, 27)
round(mean(age), digits = 0)
even <- seq(2, 100, by = 2)
summary(even)

a <- c(1, 2, 3, "a", 5)
mean(a)
a
a <- as.numeric(a)

mean(a2, na.rm = TRUE)


color_palette <- colors()
length(color_palette)

color_palette[1]

color_palette[c(5,7,9)]



x_norm <- rnorm(1000, mean = 0, sd = 1)

x_norm[c(10, 20)]

x_norm_neg <- x_norm[x_norm < 0]
length(x_norm_neg)

sum(x_norm < 0)

x_norm_2 <- x_norm[x_norm < -2 | x_norm > 2]

length(x_norm_2)/length(x_norm)


age <- c(23, 24, 25, NA)
age[4] <- 23
temp <- age[4]
temp <- 23
temp
age[is.na(age)] <- 23

x <- c(5, 15, NA, 25, 30)
x[is.na(x)] <- 20
data("starwars")
starwars
head(starwars, 2)
View(starwars)
list.files()
getwd()
"data/pop.csv"
"../"

pop_df <- read.csv("data/pop.csv")
head(pop_df)

pop2_df <- read.csv("data/pop2.csv", sep = ";")
head(pop2_df)


pop_df3 <- read.csv("/Users/arunfrey/Dropbox/06_service/teaching/intro-to-R/data/pop.csv")

pop_df3 <- foreign::read.dta("data/pop.dta")
tail(pop_df3)
View(pop_df)
# Day 2 


gapminder_df <- gapminder::gapminder
head(gapminder_df)

life_exp <- gapminder_df$lifeExp
mean(gapminder_df$lifeExp)
summary(gapminder_df$year)


starwars$height
mean(starwars$height)
mean(starwars$height, na.rm = TRUE)

sum(is.na(starwars$height))

table(starwars$heigh)
?table

?starwars

install.packages("tidyverse")
library(tidyverse)



df <- data.frame("var1" = c(1, 2, 3), 
                 "var2" = c(4, 5, 6))

df

df[1, 1]
df[1, "var1"]
df[2, 2]
df[2, "var2"]

df[, "var1"]

df[c(1, 2), c(1, 2)]
df[c(1, 2), c("var1", "var2")]
df[c(1:2), ]

x <- starwars[1:50, "height"]

mtcars

mtcars_6cyl <- mtcars[mtcars$cyl<6, ]

cyl_vec <- mtcars$cyl<6
mtcars_6cyl2 <- mtcars[cyl_vec, ]

dim(mtcars)
dim(mtcars_6cyl)
dim(mtcars_6cyl2)

mtcars_na_cyl <- mtcars[is.na(mtcars$cyl), ]
mtcars_na <- mtcars[is.na(mtcars), ]
mtcars_na
mtcars_na_cyl


mtcars_6cyl_20mpg <- mtcars[mtcars$mpg>20 & mtcars$cyl==6, ]
mtcars_6cyl_20mpg_hp <- mtcars[mtcars$mpg>20 & mtcars$cyl==6, "hp"]
mtcars_6cyl_20mpg
mtcars_6cyl_20mpg_hp
head(mtcars_6cyl_20mpg)

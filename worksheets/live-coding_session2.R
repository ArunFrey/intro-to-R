# reading a csv directly from github
url <- "https://raw.githubusercontent.com/ArunFrey/intro-to-R/main/data/gapminder_df.csv"
df <- read.csv(url)

# if I would have the dataset stored on my desktop, I could open like this: 
df <- read.csv("intro-to-R_repo/data/gapminder_df.csv")

x <- c(1:1000)
df <- data.frame(x)
df$y <- c(1000:1999)

mtcars[mtcars$cyl == 6, c("mpg", "cyl")]

# calculate the mean, min and max of mpg 
summary(mtcars)

summary(mtcars$mpg)

mtcars_mpg <- mtcars[, "mpg"]
mean(mtcars_mpg)
min(mtcars_mpg)
max(mtcars_mpg)

mean(mtcars$mpg)
max(mtcars$mpg)
min(mtcars$mpg)

# calculate the proportion of cars with 6 cylinders
mean(mtcars[, 2] == 6)
mean(mtcars[, "cyl"] == 6)
mean(mtcars$cyl == 6)

# generate a new dataset, mpg_20, which only includes cars with mpg of 20 or above
mtcars_mpg20_1 <- subset(mtcars, mtcars$mpg >= 20)
mtcars_mpg20_2 <- mtcars[mtcars$mpg >= 20, ]

dim(mtcars_mpg20_1)
dim(mtcars_mpg20_2)


# Creating a one-line mean function
mean_ft <- function(x) return(sum(x)/length(x))
mean_ft(c(10, 15, 20))

#



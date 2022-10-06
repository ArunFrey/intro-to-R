# Create a vector x with 1 to 50 
x <- c(1:50)
x
# create a logical vector y thats true when x is smaller than 25
y <- x < 25
y
# create a vector c(0, 5, 10, 15)
v1 <- c(0, 5, 10, 15)
v2 <- seq(0, 15, 5)
v1 == v2
my_name <- c('hello', 'my', 'name', 'is')
my_name2 <- c(my_name, "Arun")
my_name2

age <- c(22, 24,25, 25, 22, 21, 28, 23, 24, 27)
welcome <- c("Welcome", "to", "this", "course!")

# Use r to generate the unique values in age
unique(age)

# length of welcome
length(welcome)

# mean of age 
mean(age)

# rounded the mean of age to 0 decimals 
round(mean(age), 0)
?round

# can you compute the mean of welcome 
mean(welcome)
welcome
# no, because it's a character vector


# Exercise 2

# Generate a vector including even numbers between 2 and 100. store in even
even <- seq(from = 2, to = 100, by = 2)

# generate summary stats for even
summary(even)

# check the length of my_name2. Modify the vector to be of length 1
my_name2 <- c("My", "name", "is", "Arun")
my_name2
my_name3 <- paste(my_name2, collapse = " ")
my_name3

# what happens when you run x <- c(1, 2, "a", 4, 5), mean(x)
x <- c(1, 2, "a", 4, 5)
x
x2 <- as.numeric(x)
x2
mean(x2, na.rm = TRUE)

round(mean(as.numeric(c(1, 2, 3, "A", 5)), na.r= TRUE), 1)

# Generates a standard normal distribution
x_norm <- rnorm(1000, mean = 0, sd = 1)
x_norm

#Get the 10th and 20th observation
x_norm[c(10, 20)]

# get the 100th observation
x_norm[c(100)]

# Save all observations below 0 in a new variable called x_norm_neg.
x_norm_neg <- x_norm[x_norm < 0]
x_norm_neg 

# How many observations are below 0?
length(x_norm_neg)
sum(x_norm)

# Get the proportion of values below -2 and above 2.
mean(x_norm < -2 | x_norm > 2)

# Exercise 3
# 1. Download the data files in csv, rda and dta format
pop_df1 = read.csv("https://raw.githubusercontent.com/ArunFrey/intro-to-R/main/data/pop.csv")
pop_df2 = foreign::read.dta("https://raw.githubusercontent.com/ArunFrey/intro-to-R/main/data/pop.dta")
# to use the Rda file, you need to download it first and then find it from within your working directory. 
load("/Users/arunfrey/Downloads/pop.Rda")

# 2. Load the pop2.csv into R and inspect it. What's wrong and how can you fix it? 
pop4_df = read.csv("https://raw.githubusercontent.com/ArunFrey/intro-to-R/main/data/pop2.csv")
dim(pop4_df) 
# we can see that R thinks there is only 1 column in the data, rather than 4. 
# This is because read.csv assumes that a comma (,) was used as the separator in the data, whereas here the semi-colon was used
# we can fix this by specifying the separator (sep = ';' ) within the read.csv file (check ?read.csv for help)
pop5_df = read.csv("https://raw.githubusercontent.com/ArunFrey/intro-to-R/main/data/pop2.csv", sep =  ";")

# 3. Save the datasets back onto your workspace
write.csv(pop_df1, file = "[specify file location here]/pop_new.csv")
foreign::write.dta(pop_df1,  file = "[specify file location here]/pop_new.dta")
save(pop_df1, file = "[specify file location here]/pop_new.Rda")

# 5. Generate a new dataset out of the following vectors: 
country <- c("Rwanda", "Mexico", "France", "Vietnam", "United Kingdom")
continent <- c("Africa", "Americas", "Europe", "Asia", "Europe")
life_exp <- c(46.2, 76.2, 80.7, 74.2, 79.4)
gdp_pc <- c(863, 11978, 30470, 2442, 33203)

df = data.frame("country" = country, 
                "continent" = continent, 
                "life_exp" = life_exp, 
                "gdp_pc" = gdp_pc)


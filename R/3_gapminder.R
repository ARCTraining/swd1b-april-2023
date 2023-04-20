# download the gapminder data
download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder_data.csv", 
              destfile = "data/gapminder_data.csv")

# load the gapminder data from csv

gapminder <- read.csv(file = "data/gapminder_data.csv")

# check structure of the data
str(gapminder)

# take a peek at the top
head(gapminder)

# take a peek at the bottom
tail(gapminder)

# get a summary of statistics from the data
summary(gapminder)

# start to get column level statistical data
mean(gapminder$lifeExp)

# get column names
names(gapminder)

# get count information for each unique value
table(gapminder$country)

## subsetting dataframes

# subset the data for 
# rows where the country column was "Mongolia"
mongolia_gp <- gapminder[gapminder$country %in% c("Mongolia"), ]

mean(mongolia_gp$gdpPercap)

# subset our data for countries in asia
# between the years 1967 and 1982
unique(gapminder$year)
unique(gapminder$continent)

asia_mask <- gapminder$continent %in% c("Asia")

lt_1982_mask <- 1982 >= gapminder$year

gt_1967_mask <- gapminder$year >= 1967

# using & operator to combine 
# logical vectors
# TRUE = TRUE & TRUE v FALSE = TRUE & FALSE

full_mask <- asia_mask & lt_1982_mask & gt_1967_mask

unique(gapminder[full_mask, c("year")])













# install the tidyverse packages
install.packages("tidyverse")

# load the gapminder data
gapminder <- read.csv(file = "data/gapminder_data.csv")

# in base R

mean(gapminder[gapminder$continent %in% "Africa", 
               "gdpPercap"])

mean(gapminder[gapminder$continent %in% "Americas", 
               "gdpPercap"])

for (cont in unique(gapminder$continent)) {
  print(cont)
  print(
    mean(gapminder[gapminder$continent %in% cont,
         "gdpPercap"])
  )
}

# load packages with library
library(dplyr)

year_country_gdp <- select(gapminder, year, country,
                           gdpPercap)

head(year_country_gdp)

year_country_gdp <- gapminder %>%
  select(year, country, gdpPercap)

head(year_country_gdp)

# select some columns
# and filter on Africa for continent

gapminder %>%
  filter(continent == "Europe") %>%
  select(year, country, gdpPercap)

# lets groupby our data 

str(gapminder)

str(gapminder %>% group_by(continent))

# lets use summarise to calculate the mean gdppercap
# on each continent

gdp_bycontinent <- gapminder %>%
  group_by(continent) %>%
  summarize(mean_gdpPercap = mean(gdpPercap))

# coerce to data.frame
as.data.frame(gdp_bycontinent)

# so lets groupby year and continent

gapminder %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap))

# calculate a whole new dataframe
# of summary statistics

gapminder %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop)
  )

# counting observations

gapminder %>%
  filter(year == 2002) %>% 
  count(continent, sort = TRUE)

# lets say we want to calculate the standard error
# for that we need number of obs

gapminder %>%
  group_by(continent) %>% 
  summarize(se_le = n())

gapminder %>%
  count(continent)

# using mutate to create variables 
# on the fly
# lets create a gdp column from percap * pop


gdp_pop_bycontinent_byyear <- gapminder %>%
  mutate(gdp_billions = gdpPercap * pop /10^9) %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop),
            mean_gdp_billions = mean(gdp_billions),
            sd_gdp_billions = sd(gdp_billions))

gdp_pop_bycontinent_byyear

# we can combine ifelse and dplyr
# to conditionally create new data

gdp_pop_bycontinent_byyear_above25 <- gapminder %>%
  mutate(gdp_billions = ifelse(lifeExp > 25,
                               gdpPercap * pop /10^9,
                               NA)) %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop),
            mean_gdp_billions = mean(gdp_billions),
            sd_gdp_billions = sd(gdp_billions))

# we can use filter to drop rows based on a condition

gapminder %>%
  filter((lifeExp > 25) & (continent == "Africa"))

## plotting with ggplot2 and dplyr

library(ggplot2)

# to get the first letter of each country
first_let <- substr(gapminder$country, 
                    start =1, 
                    stop =1)

az.countries <- gapminder[first_let %in% c("A","Z"),]

# make the plot

ggplot(data = az.countries, 
       mapping = aes(x = year, 
                     y = lifeExp, 
                     color = continent)) +
  geom_line() +
  facet_wrap(~ country)

# using dplyr

gapminder %>% 
  mutate(first_let = substr(country, 
                            start =1, 
                            stop=1)) %>%
  filter(first_let %in% c("A","Z")) %>%
  ggplot(mapping = aes(x = year,
                       y = lifeExp,
                       color = continent)) +
  geom_line() +
  facet_wrap(~ country)






































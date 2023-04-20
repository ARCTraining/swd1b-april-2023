# R can create plots on it's own

x <- 1:10
y <- 1:10 * 2

plot(x,y)

# we need to install 3rd party packages
# we do this using install.packages
# which installs them from CRAN
install.packages(c("ggplot2"))

# load a package into our environment
library(ggplot2)

# load some data to plot

gapminder <- read.csv(file = "data/gapminder_data.csv")

head(gapminder)

# lets make a basic scatter plot

ggplot(data = gapminder, 
       mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

# native R plot

plot(gapminder$gdpPercap, gapminder$lifeExp)


# plot the lifeExp over time

ggplot(data = gapminder, 
       mapping = aes(x = year, 
                     y = lifeExp, 
                     color=continent)) +
  geom_point()


# line plot of lifeExp per country 

ggplot(data = gapminder,
       mapping = aes(x = year,
                     y = lifeExp,
                     color=continent,
                     by=country)) +
  geom_line() + geom_point()

# create a new plot where line colours 
# are managed by the geom

ggplot(data = gapminder,
       mapping = aes(x = year,
                     y = lifeExp,
                     by=country)) +
  geom_line(mapping = aes(color = continent)) +
  geom_point()

# change the colour palette using RColorBrewer palettes
# https://colorbrewer2.org/#type=qualitative&scheme=Set3&n=5

ggplot(data = gapminder,
       mapping = aes(x = year,
                     y = lifeExp,
                     by=country)) +
  geom_point() +
  geom_line(mapping = aes(color = continent)) +
  scale_color_brewer(palette = "Dark2")

# change the geom_point colour to red

ggplot(data = gapminder,
       mapping = aes(x = year,
                     y = lifeExp,
                     by=country)) +
  geom_point(mapping = aes(color = "red")) +
  geom_line(mapping = aes(color = continent)) +
  scale_color_brewer(palette = "Dark2")

## can get around this by reordering our layers

ggplot(data = gapminder,
       mapping = aes(x = year,
                     y = lifeExp,
                     by=country))  +
  geom_line(mapping = aes(color = continent)) +
  scale_color_brewer(palette = "Dark2") +
  geom_point(mapping = aes(color = "red"))

# chatgpt helped here
# how do we get the geom_point coloured red
# but the geom_lines coloured with Dark2 palette
library(RColorBrewer)

ggplot(data = gapminder,
       mapping = aes(x = year,
                     y = lifeExp,
                     by=country)) +
  geom_point(mapping = aes(color = "#e41a1c")) +
  geom_line(mapping = aes(color = continent)) +
  scale_color_manual(values = c("#e41a1c",
                                brewer.pal(5, "Dark2"))) 


# manually configure colours 
# with scale_color_manual
ggplot(data = gapminder,
       mapping = aes(x = year,
                     y = lifeExp,
                     by=country)) +
  geom_line(mapping = aes(color = continent)) +
  scale_color_manual(values=c("red","blue","purple","green","black")) +
  geom_point()

# applying statistical visualisation to our plot

# this data is very clustered
ggplot(data = gapminder, mapping = aes(x = gdpPercap,
                                       y = lifeExp)) +
  geom_point()


# apply log10 transform to visualise better
ggplot(data = gapminder,
       mapping = aes(x = gdpPercap,
                     y = lifeExp)) +
  # adjust the transparency
  geom_point(alpha = 0.5) +
  scale_x_log10() +
  geom_smooth(method = "lm", linewidth = 4)


## multi panel figures

# subset the data for the americas
americas <- gapminder[gapminder$continent 
                      %in% "Americas",]

head(americas)

ggplot(data = americas,
       mapping = aes(x = year, 
                     y = lifeExp)) +
  geom_line() +
  facet_wrap(~ country) +
  theme(axis.text.x = element_text(angle = 45))

## adding some styling to our plot

my.plot <- ggplot(data = americas,
       mapping = aes(x = year,
                     y = lifeExp)) +
  geom_line() +
  facet_wrap(~ country) +
  theme(axis.text.x = element_text(angle = 45))

# centering the plot title
my.plot <- my.plot + 
  labs(x = "Year",
       y = "Life Expectancy",
       title = "Figure 1"
       ) +
  theme(plot.title = element_text(hjust = 0.5))

## saving our plot with ggsave

ggsave(filename = "figures/lifeExp.png",
       plot = my.plot,
       width = 24,
       height = 20,
       units = "cm",
       dpi = 300)

# saving the file with multiple file endings
# using a for loop 

for(file in c(".png",".jpg",".pdf")) {
  ggsave(filename = paste0("figures/lifeExp",file),
         plot = my.plot,
         width = 24,
         height = 20,
         units = "cm",
         dpi = 300)
}















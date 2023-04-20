# Introduction to dataframes in R
# Alex Coleman
# 2023-04-19

# create a dataframe 

cats <- data.frame(coat = c("calico","black","tabby"),
                   weight = c(2.1, 5.0, 3.2),
                   likes_string = c(1, 0, 1))

# write our cats dataframe to disk
# don't save the row.names
write.csv(cats, file = "data/feline-data.csv", 
          row.names = FALSE)

# deleting cats from environment
rm(cats)

# load cats from disk
# read.csv
cats <- read.csv(file = "data/feline-data.csv")

# columns are vectors
cats$coat

# we can do vector operations on column values
cats$weight + 2

# string concatenation on column
paste("This cat is", cats$coat)

# we can add a new column
cats$foo <- 1

# create a new column with new strings
# from another column
cats$bar <- paste("This cat is", cats$coat)


# show example of functions returning NA
# NAs can be annoying!
cats$weight + as.factor(cats$coat)

# factors

coats <- c("tabby", "tortoiseshell", "tortoiseshell",
           "black","tabby")

coats

str(coats)
?str

# convert vector of strings into factors
CATegories <- factor(coats)

CATegories
class(CATegories)
class(coats)

str(CATegories)
typeof(CATegories)

## lists

# lists can contain data with different types
list_example <- list(1, "a", TRUE, 1+4i)

list_example

## data is nested within lists to preserve
# vector type rules

# use nested subsetting for values in a list
list_example[[1]]

# named lists
another_list <- list(title = "numbers", numbers = 1:10,
                     data = TRUE)


another_list

# get vector from list with $ operand
another_list$title

# get the item on row 1 for every column
another_list[1, ]

# using a dataframe if we want just the first row
# [row number, column name]
cats[1, ]

# matrices

matrix_eg <- matrix(0, ncol=6, nrow=3)

matrix_eg

# get the structure
str(matrix_eg)

# dimensions
dim(matrix_eg)

# number of rows
nrow(matrix_eg)

# number of columns
ncol(matrix_eg)









# a deeper dive into R data.frames

cats <- read.csv(file = "data/feline-data.csv")

## adding new columns

age <- c(2, 3, 5)

# we also use cbind
cbind(cats, age)

# lets try and cbind a vector with 4 elements

age <- c(2, 3, 5, 8)

cbind(cats, age)

# get the number of rows
nrow(cats)

# get the length of a vector
length(age)
# nrow(age) gives us NULL
nrow(age)

# get it working
age <- c(2, 3, 5)

cats <- cbind(cats, age)
cats

# adding a new row
# has to be a list because of different types
newRow <- list("tortoiseshell", 3.3, TRUE, 9)
rbind(cats, newRow)

## removing rows

#subset a row with row name
cats[1, ]

# use a negative index to remove a row
cats[-1,]

# we can use a vector to remove multiple rows
# at the same time

cats[-c(1,2), ]

# can create a subset variable based on the above

tabby.cats <- cats[-c(1,2), ]
tabby.cats

## removing columns

cats[, -4]

# dropping columns
# get column names
names(cats)

# to check if a elements in one character vector
# are in another we use %in%

drop <- names(cats) %in% c("age")
drop

# this just subsets out the age column
cats[, drop]

# we can invert the boolean vector
# to subset out all but the age column with !

cats[, !drop]

## lets say I want to subset my data
# so it has all the rows
# but only coat and weight columns

col_mask <- names(cats) %in% c("coat", "weight")

cats[, col_mask]


## appending dataframes

# create cats with messed up rownames
cats <-rbind(cats[-1,], cats)

# get row names
rownames(cats) 

# reset the rownames 
rownames(cats) <- NULL

cats





















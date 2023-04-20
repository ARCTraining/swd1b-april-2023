# controlling the flow of our applications

# if statement

x <- 8 

if (x >= 10 ) {
  # this code will run if x is TRUE
  print("X is greater than or equal to 10!")
} else {
  print("X is less than 10")
}

x

# we can test multiple conditions using else if

x <- 8 

if (x >= 10) {
  print("X is greater than or equal to 10")
} else if (x > 5) {
  print("X is greater than 5, but less than 10")
} else {
  print("X is less than 5")
}

x

# we can also use ifelse for 2 condition tests

x <- 8
ifelse(x >= 10, 
       "X is greater than or equal to 10",
       "X is less than 10")


# we can do assignment from if statements

foo <- "bar"

test <- if(foo == "foobar") {
  10
} else {
  1
}

test

# the above is equivalent to
if(foo == "foobar"){
  test <- 10
}else{
  test <- 1
}

test

# even neater way to do the above is with ifelse
test <- ifelse(foo == "foobar", 10, 1)

# we can do the test outside of the if statement

test <- 1 == 1

if (test) {
  print("Test was TRUE!")
} else {
  print("Test was FALSE!")
}

# if statements take ONLY atomic logical vectors

test <- c(TRUE, FALSE)

if (test) {
  print("TRUE")
} else {
  print("FALSE")
}

# are any elements in our logical vector TRUE?
any(test)

# are all elements in our logical vector TRUE?
all(test)

## for loops

# for each item (i) in the vector of 1 to 10
# print the value of i
# keep going until we've printed the last item
# in the vector
for (i in 1:10) {
  print(i)
}

bag <- c("magic","hogwarts","bird")

# for returns individual elements
# rather than a vector
for (i in bag) {
  print(paste("This is",i))
}

# paste works on a vector and returns a vector
# of the same shape
paste("This is a", bag)


# nested for loops
# to run a for loop inside a for loop

for (i in 1:5) {
  for (j in c("a","b","c","d","e")) {
    print(paste(i,j))
  }
}

# capturing the results of a for loop
# inside a new vector

# create an empty vector
output_vec <- c()

for (i in 1:5) {
  for (j in c("a","b","c","d","e")) {
    # create a temporary variable in the loop
    temp_var <- paste(i,j)
    output_vec <- c(output_vec, temp_var)
  }
}

output_vec

## growing a vector isn't ideal in R
# it's very inefficent
# much better to preallocate memory in advance



j_vector <- c("a","b","c","d","e")

for (i in 1:5) {
  for (j in 1:5) {
    temp_output <- paste(i, j_vector[j])
    output_matrix[i, j] <- temp_output
  }
}

output_matrix

#coerce the matrix to a vector
as.vector(output_matrix)

## while loops

z <- 1

while(z > 0.1) {
  #randomly sample from uniform distribution
  # and update z so that z could potentially be 
  # < 0.1
  z <- runif(1)
  cat(z, "\n")
}



















































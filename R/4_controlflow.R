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



















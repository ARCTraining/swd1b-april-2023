# writing our own functions
source("R/load_data.R")

fahr_to_kelvin <- function(temp) {
  stopifnot(is.numeric(temp))
  kelvin <- ((temp - 32) * (5 / 9)) + 273.15
  return(kelvin)
}

fahr_to_kelvin(32)

# kelvin to celsius

kelvin_to_celsius <- function(temp) {
  celsius <- temp - 273.15
  return(celsius)
}

fahr_to_celsius <- function(temp) {
  temp_k <- fahr_to_kelvin(temp)
  result <- kelvin_to_celsius(temp_k)
  return(result)
}

fahr_to_celsius(100)

fahr_to_celsius("100")





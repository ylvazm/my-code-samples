
# Temperature Converter

#   This function allows the user to enter a temperature in either Celsius, 
#   Fahrenheit or Kelvin and choose an outcome unit to convert the input temperature 
#   to. The function is applicable to single values, vectors, matrices and so on.
#   The values are automatically rounded to 2 decimal digits.

tempconverter <- function(value, from, to) {
  
  # Step 1: check if given units are valid, stop if it is not C, F or K (or c, f or k)
  norm <- function(u) {
    u <- tolower(trimws(u))
    if (!u %in% c("c", "f", "k")) stop("Unit must be one of 'C','F','K'.")
    u
  }
  from <- norm(from)
  to <- norm(to) #apply the unit checks to both arguments "from" and "to".
  
  # Step 2: check if given value is valid, stop if it is not numeric
  if (!is.numeric(value)) stop("value must be numeric (vector or matrix).")
  
  # Step 3: auxiliary functions: first convert to celsius, from there to the chosen outcome
  
  # Step 3a: Convert given value to Celsius unless it already is Celsius.
  to_c <- function(x, u) {
    if (u == "c") x #                   keep value if to = "c".
    else if (u == "f") (x - 32) * 5/9 # convert fahrenheit value to celsius.
    else x - 273.15 #                   convert kelvin value to celsius.
  }
  
  # Step 3b: Convert Celsius to target unit unless it already is Celsius.
  from_c <- function(x, u) {
    if (u == "c") x #                   keep value if to = "c".
    else if (u == "f") x * 9/5 + 32 #   convert celsius value to fahrenheit.
    else x + 273.15 #                   convert celsius value to kelvin.
  }
  
  # Step 4: This is the conversion pipeline source -> Celsius -> target.
  celsius <- to_c(value, from)
  result  <- from_c(celsius, to)
  
  # Step 5: round and give result 
  round(result, 2)
}

# Example Calls

tempconverter(22, "C", "F") # Converts 22 °C correctly to 71.6 °F.
tempconverter(43.77, "F", "k") #converts 43.77 °F correctly to 279.69 K.

# Example of how to apply this function to a dataset

data(pressure) #load dataset "pressure"
?pressure #contains vapor pressure of Mercury at different temperatures in °C

head(pressure)

# Add a new column with Fahrenheit values to the dataset
pressure$temperature_F <- tempconverter(pressure$temperature, from = "C", to = "F")

head(pressure)




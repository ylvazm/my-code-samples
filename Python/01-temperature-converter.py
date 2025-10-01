
# Temperature Converter

end = 0

print("Temperature Converter")
print("Type 'end' anytime to exit the program.")
print("")

while end == 0:
    print("Please enter the temperature in Celsius that you would like to convert:")
    ein = input()

    # Check if user wants to exit the converter
    if ein.lower() == "end":
        print("Exiting temperature converter")
        end = 1
        break

    # Convert the input temperature 
    tempc = float(ein)
    tempf = tempc * 1.8 + 32
    tempfr = round(tempf,2)
    tempk = tempc + 273.15
    tempkr = round(tempk,2)

    # Print the converted temperatures
    print()
    print("Temperature in Fahrenheit: ", tempfr,"°F")
    print("Temperature in Kelvin: ", tempkr,"K")
    print("___________________")
    print()


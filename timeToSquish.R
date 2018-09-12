####code to calculate time until fish squish

responseUnits <- 'LIST UNITS' 
while(responseUnits == 'LIST UNITS')
{
  responseUnits <- readline("Enter requested unit of time. Enter 'LIST UNITS' for available units.    ")
  if(responseUnits == 'LIST UNITS')
  {
    cat("Seconds \n Minutes \n Hours \n Days \n Weeks \n Microcenturies \n Jiffy \n Light-foot \n New York Minutes") 
  }
}

#default delivers time in days
scaleFac <- 1

if(responseUnits == "Seconds")
{
  scaleFac <- 60*60*24
}

if(responseUnits == "Minutes")
{
  scaleFac <- 60*24
}

if(responseUnits == "Hours")
{
  scaleFac <- 24
}

if(responseUnits == "Weeks")
{
  scaleFac <- 1/7
}

if(responseUnits == "Microcenturies")
{
  scaleFac <- (365.24*100/(10^6))^(-1)
  cat("Happens to be the maximum allowable lecture time, according to mathematician John von Neumann\n")
}

if(responseUnits == "Jiffy")
{
  scaleFac <- 60*60*24*(1/29979245800)^-1
}

if(responseUnits == "Light-foot")
{
    cat("pew pew, physics speed!")
    scaleFac <- 24*60*60*(299792458*0.3048^-1)
}

if(responseUnits == "New York Minutes")
{
  cat("Undefined. Using Everywhere Else Minutes instead.")
  scaleFac <- 24*60
  responseUnits <- "Minutes"
}

planeArrival <- readline("Enter arrival time in your timezone: yyyy-mm-dd-hh-mm     ")

arrivalList <- list(substr(planeArrival, 1,10), paste(substr(planeArrival, 12,13), 
                                                      substr(planeArrival, 15,16), sep = ""))
arrivalList[[2]] <- as.numeric(arrivalList[[2]])

arriveFormat <- sprintf("%s %04d", arrivalList[[1]], arrivalList[[2]])
arriveTime <- as.POSIXlt(arriveFormat, format = "%Y-%m-%d %H%M")
timeDiff <- scaleFac*(arriveTime - Sys.time())

print(paste("Time to squish:", timeDiff, responseUnits))

write("Hello world", stdout())

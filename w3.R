managers_data<- read.csv('managers.csv', na = "")

#view the structure of df
str(managers_data)

#converting date to date variable (dd/mm/yyyy)

converted_date <- as.Date(managers_data$Date, "%m/%d/%y")
converted_date
str(converted_date)

#replacing the date field 
managers_data$Date <- converted_date
str(managers_data)

managers_data$age <- as.integer(managers_data$Age)
str(managers_data)

start_date <- as.Date("2018-10-15")
end_date <- as.Date("2018-11-01")
new_date <- managers_data[managers_data$Date >= start_date & managers_data$Date <= end_date,]
new_date 

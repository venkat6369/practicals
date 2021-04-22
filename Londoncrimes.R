#Question1---------------------------------------------------------------------------------
#Reading london crimes Data from csv------------------------------------ 

london_crime<-read.csv("london-crime-data.csv")
london_crime


#pasting the month and year in newly created date column ans adding in date -----------------------------------

london_crime$Date <- paste("01", london_crime$month, london_crime$year, sep ="/")

london_crime$Date <- as.Date(converted_date, "%d/%m/%Y")

london_crime

#Question2---------------------------------------------------------------------------------

#Dropping unwanted columns and obtained the required dataset---------------------------------------

london_crime<- subset(london_crime,select = -c(ï..lsoa_code,month,year))
london_crime

#Renaming columns as required----------------------------------------------------

names(london_crime)[2] <-"Borough"
names(london_crime)[3] <-"MajorCategory"
names(london_crime)[4] <-"SubCategory"
names(london_crime)[5] <-"Value"
names(london_crime)[8] <-"CrimeDate"
london_crime


#Question3---------------------------------------------------------------------------------
#The Crime_date variable is already in date type-----------------------
#no changes to be done----------------------------------

str(london_crime)

#Question4---------------------------------------------------------------------------------
#plotting the stats of Borough---------------------------

london_crime$Borough <-factor(london_crime$Borough)

plot(
  london_crime$Borough, main = "count of Crimes in the City", xlab = "City", ylab = "Count of  Crimes")

summary(london_crime$Borough)

#Highest count is Croydon city is 5226-----------------------------------------------
#lowest count is  London city is 86-----------------------------------------------------

#Question5---------------------------------------------------------------------------------
#Plotting the visualisation for major category---------------------

london_crime$MajorCategory <-factor(london_crime$MajorCategory)

plot(
  london_crime$MajorCategory, main = "Major Category of Crimes", xlab = "Major Category", ylab = "Count of Crimes")

summary(london_crime$MajorCategory)

#Visualisng the major category of crimes through piechart---------------------------------------

labels<-summary(london_crime$MajorCategory)

#Labelling the labels of  chart------------------------------------

pie(labels,main = "Major Category of Crimes")


# Highest level of crimes is Theft and Handling 33759---------------------------------
# Lowest level of crimes is  Sexual offenses 917------------------------------------------


#Question6---------------------------------------------------------------------------------
#Getting the region for required places of Borough---------------------------------------------------

attach(london_crime)
london_crime$Region[Borough =='Barking and Dagenham '] <- "East"
london_crime$Region[Borough =='Barnet'] <- "North"
london_crime$Region[Borough =='Bexley'] <- "East"
london_crime$Region[Borough =='Brent'] <- "West"
london_crime$Region[Borough =='Bromley'] <- "South"
london_crime$Region[Borough =='Camden'] <- "North"
london_crime$Region[Borough =='Croydon'] <- "South"
london_crime$Region[Borough =='Ealing'] <- "West"
london_crime$Region[Borough =='Enfield'] <- "North"
london_crime$Region[Borough =='Greenwich'] <- "East"
london_crime$Region[Borough =='Hackney'] <- "North"
london_crime$Region[Borough =='Hammersmith and Fulham'] <- "West"
london_crime$Region[Borough =='Haringey'] <- "North"
london_crime$Region[Borough =='Harrow'] <- "West"
london_crime$Region[Borough =='Havering'] <- "East"
london_crime$Region[Borough =='Hillingdon'] <- "West"
london_crime$Region[Borough =='Hounslow'] <- "West"
london_crime$Region[Borough =='Islington'] <- "Central"
london_crime$Region[Borough =='Kensington and Chelsea'] <- "Central"
london_crime$Region[Borough =='Kingston upon Thames'] <- "East"
london_crime$Region[Borough =='Lambeth'] <- "Central"
london_crime$Region[Borough =='Lewisham'] <- "Central"
london_crime$Region[Borough =='Merton'] <- "South"
london_crime$Region[Borough =='Newham'] <- "East"
london_crime$Region[Borough =='Redbridge'] <- "East"
london_crime$Region[Borough =='Richmond upon Thames'] <- "West"
london_crime$Region[Borough =='Southwark'] <- "Central"
london_crime$Region[Borough =='Sutton'] <- "South"
london_crime$Region[Borough =='Tower Hamlets'] <- "Central"
london_crime$Region[Borough =='Waltham Forest'] <- "Central"
london_crime$Region[Borough =='Wandsworth'] <- "East"
london_crime$Region[Borough =='Westminster'] <- "Central"


london_crime$Region[is.na(london_crime$Region)] = "Central"
london_crime


#Question7---------------------------------------------------------------------------------
#Charting the infographics Region wise------------------------

london_crime$Region <-factor(london_crime$Region)
plot(
  london_crime$Region, main = "Region wise crimes", xlab = "Region", ylab = "Number of Regions")
summary(london_crime$Region)

#The highest number of crimes are in Central region = 28505-----------------------------------
#The lowest number of crimes are in South region = 15487--------------------------------------




#Question8---------------------------------------------------------------------------------
#Extracting and charting the Highest and lowest level of crimes-----------------------------------

summary(london_crime$Region)

Regionwise_crimes <- summary(london_crime$Region)

pie(Regionwise_crimes,main = " Category wise split of Crimes")

#Theft and Handling is which is around 33759-------------------------------------------------



#Question9---------------------------------------------------------------------------------
#Charting  City on the X Axis of the chart and  Plotting No of Crimes on the Y axis--------------------------
#Text on the chart is represented vertically

summary(london_crime$Region)
plot(
  london_crime$Region, main = "Region wise crimes", xlab = "Region", ylab = "Number of Regions")



#Question10---------------------------------------------------------------------------------
# Saving the modified London Crime Data set into a csv file------------------------------------------------------ 
write.csv(london_crime, file = "london-crime-modified.csv")
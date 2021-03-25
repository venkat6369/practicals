#creating a dataframe for the ufo data which is in csv form----------------------

ufocsv_df <- read.csv("ufo.csv", na = "")

#viewing the structure of dataframe----------------------

str(ufocsv_df)

#displaying first 15 rows of the dataset--------------------------------
ufocsv_df[1:15, ]

# confirming that dataset has the same no of rows as csv----------------------

date_variable <- as.Date(ufocsv_df$datetime)
str(date_variable)

ufocsv_df$datetime <- date_variable
str(ufocsv_df)

#changing the names of columns --------------------------------------
names(ufocsv_df)[6] <- paste("DurationSeconds")
names(ufocsv_df)[7] <- paste("DurationHrsMins")
names(ufocsv_df)[9] <- paste("DatePosted")
names(ufocsv_df)[8] <- paste("comments")

names(ufocsv_df)

#changing latitude to numerical-------------------------
ufocsv_df$latitude <- as.numeric(ufocsv_df$latitude)
str(ufocsv_df$latitude)
#viewing complete cases of information in dataset
cc <- complete.cases(ufocsv_df)
sum(cc)

#missing values in dataset------------------------------------------------------- 

install.packages("mice") 
library(mice)
md.pattern(ufocsv_df)

install.packages("VIM")
library(VIM)

missing_values <- aggr(ufocsv_df, prop = FALSE, numbers = TRUE)
summary(missing_values)


#sorting dataset based on shape and city-------------------------------------------------

attach(ufocsv_df)
sorted_df <- ufocsv_df[order(shape,city),]
ufocsv_df <- sorted_df

sorted_ufo_data_list <- names(ufocsv_df) %in% c ("datetime", "city", "country", "shape")
sorted_ufo_data_list

sorted_ufo_data <- ufocsv_df[(sorted_ufo_data_list)]
sorted_ufo_data[1:15, ]

attach(sorted_ufo_data)
ufo_gb_disk <- subset(sorted_ufo_data, country == "gb" & shape == "disk" )
str(ufo_gb_disk)


# storing the modified df as csv-------------------------------------------------------------
write.csv(ufocsv_df, file = "modified_ufo.csv")
write.csv(ufo_gb_disk, file = "ufo_gb.csv")
write.csv(sorted_ufo_data, file = "sorted_ufo.csv")

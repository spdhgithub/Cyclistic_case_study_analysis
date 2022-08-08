install.packages("tidyverse")
library(tidyverse)
trips_2021_01<-read.csv("202101-divvy-tripdata.csv")
trips_2021_02<-read.csv("202102-divvy-tripdata.csv")
trips_2021_03<-read.csv("202103-divvy-tripdata.csv")
trips_2021_04<-read.csv("202104-divvy-tripdata.csv")
trips_2021_05<-read.csv("202105-divvy-tripdata.csv")
trips_2021_06<-read.csv("202106-divvy-tripdata.csv")
trips_2021_07<-read.csv("202107-divvy-tripdata.csv")
trips_2021_08<-read.csv("202108-divvy-tripdata.csv")
trips_2021_09<-read.csv("202109-divvy-tripdata.csv")
trips_2021_10<-read.csv("202110-divvy-tripdata.csv")
trips_2021_11<-read.csv("202111-divvy-tripdata.csv")
trips_2021_12<-read.csv("202112-divvy-tripdata.csv")

## Installing some packages for our analysis and cleaning
install.packages("dplyr")
install.packages("skimr")
install.packages("tidyr")
install.packages("janitor")
library("skimr")
library(tidyr)
library(dplyr)
library(janitor)

## data source: https://divvy-tripdata.s3.amazonaws.com/index.html

## combining 12 data frames into 1 dataframe 
bike_rides<-rbind(trips_2021_01,trips_2021_02,trips_2021_03,trips_2021_04,trips_2021_05,
                  trips_2021_06,trips_2021_07,trips_2021_07,trips_2021_08,trips_2021_09,
                  trips_2021_10,trips_2021_11,trips_2021_12)
bike_rides <- remove_empty(bike_rides.which = c("cols"))
bike_rides <- remove_empty(bike_rides.which = c("rows"))


colnames(bike_rides)
GLIMPSE(bike_ride)
summary(bike_rides)

head(bike_rides)
str(bike_rides)

## installing "lubridate package" to work easily with date and time.

install.packages("lubridate")
library(lubridate)

## changing ended_at and started_at data type from charachter to datetime.

bike_rides <- bike_rides %>%
  mutate(bike_rides, started_at = as.POSIXct(started_at),
         ended_at = as.POSIXct(ended_at))
head(bike_rides)
str(bike_rides)

## checking the type of rideable type 
unique(bike_rides$rideable_type)

##checking the types of riders
unique(bike_rides$member_casual)

## Installing "janitor" package for cleaning the data
install.packages("janitor")
install.packages("tidyr")
library(janitor)
library(tidyr)

install.packages("dplyr")
library(dplyr)

## changing the data type of started_at and ended_at from chr to datetime.
bike_rides <- bike_rides %>%
  mutate(bike_rides,started_at = as.POSIXct(started_at),
         bike_rides,ended_at = as.POSIXct(ended_at))


## now changing the data type of start_station_id and end_station_id from chr to double:
bike_rides <- bike_rides %>%
  mutate(bike_rides, start_station_id = as.double(start_station_id),
  end_station_id = as.double(end_station_id))

str(bike_rides)

#creating some new columns
bike_rides <- bike_rides %>%
  mutate(date= as.Date(started_at)
         ,month= format(as.Date(date),"%m")
         ,year= format(as.Date(date),"%Y")
         ,day= format (as.Date(date),"%d")
         ,week_day= format(as.Date(date),"%A")
         ,hour_of_day= format(as.POSIXct(started_at),"%H"))

## creating a new column ride_length to find the difference between the ride timing:
bike_rides <- bike_rides %>%
  mutate(ride_length = difftime(ended_at, started_at))

## changing the data type of started_at and ended_at from chr to datetime.
bike_rides <- bike_rides %>%
  mutate(started_at = as.POSIXct(started_at),
         ended_at = as.POSIXct(ended_at))
str(bike_rides)
head(bike_rides)

# changing the data type of new columns
bike_rides <- bike_rides %>%
  mutate(year =as.numeric(year)
         ,hour_of_day = as.numeric(hour_of_day)
         ,day= as.numeric(day)
         ,ride_length = as.numeric(ride_length)
         ,month_name = month.abb[as.numeric(month)])

bike_rides <- bike_rides %>%
  filter(ride_length > 0)

head(bike_rides)

## deleting unneccessory columns that are not required for our analysis:
bike_rides <- subset(bike_rides, select = -c(start_lat, start_lng, end_lat, end_lng, start_station_id, end_station_id))

head(bike_rides)
dim(bike_rides)

# sorting our data according to weekays and month:
bike_rides <- bike_rides %>%
  mutate(week_day = factor(week_day, levels =c("Sunday", "Monday", 
                                               "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))
         ,month_name = factor(month_name, levels =c("Jan","Feb","Mar","Apr","May","Jun","Jul",
                                                    "Aug","Sep","Oct","Nov","Dec")))

# Now deleting all NA(missing) values from our dataframe:
bike_rides_clean <- na.omit(bike_rides)

head(bike_rides_clean)

# Descriptive analysis on ride_length 
mean(bike_rides_clean$ride_length)
median(bike_rides_clean$ride_length)
max(bike_rides_clean$ride_length)
min(bike_rides_clean$ride_length)

# we can execute the above four lines using summary function:
summary(bike_rides_clean)

# comparing members and casual users:
aggregate(bike_rides_clean$ride_length ~ bike_rides_clean$member_casual, FUN = mean)
aggregate(bike_rides_clean$ride_length ~ bike_rides_clean$member_casual, FUN = median)
aggregate(bike_rides_clean$ride_length ~ bike_rides_clean$member_casual, FUN = max)
aggregate(bike_rides_clean$ride_length ~ bike_rides_clean$member_casual, FUN = min)

# checking the distinct rideable type:
bike_rides_clean %>%
  distinct(rideable_type)
head(bike_rides_clean)

library(dplyr)
library(janitor)
library(tidyverse)


## no of customer
aggregate(ride_id~member_casual, data = bike_rides_clean, length)

## no of customers VS week_day:
weekly_riders <-aggregate(ride_id~member_casual + week_day, data = bike_rides_clean, length)

## no of customers VS month:
monthly_riders <-aggregate(ride_id~member_casual + month_name, data = bike_rides_clean, length)

## no of customers VS hour_of_the_day:
hourly_riders <-aggregate(ride_id~member_casual + hour_of_day, data = bike_rides_clean, length)

weekly_riders
monthly_riders
hourly_riders

## now doing some further analysis:
monthly_riders %>%
  group_by(member_casual)

## calculating mean ride length grouping by member_casual and month name:
bike_rides_clean %>%
  group_by(member_casual, month_name) %>%
  summarise(ride_id = n()
            ,mean_trip_length = mean(ride_length)
            , .groups = "drop")

bike_rides_clean %>%
  group_by(member_casual, month_name)%>%
  summarise(mean_trip_length = mean(ride_length)
            ,ride_id = length(ride_id))

## calculating mean ride length grouping by member_casual and week days:
bike_rides_clean %>%
  group_by(member_casual, week_day) %>%
  summarise(mean_trip_length = mean(ride_length)
            ,ride_id = length(ride_id))

## now we are visualizing our findings:
install.packages("ggplot2")
library(ggplot2)

write.csv(hourly_riders, ("hourly_riders.csv"))
write.csv(monthly_riders, ("monthly_riders.csv"))
write.csv(weekly_riders, ("weekly_riders.csv"))
write.csv(bike_rides_clean, ("bike_rides_clean.csv"))


library(installr)
updateR()


bike_rides_clean%>%
  group_by(member_casual, week_day)%>%
  summarise(ride_id = n()
            , .groups = "drop")%>%
  ggplot(aes(y=ride_id, x=week_day, fill= member_casual))+
  geom_col(position = "dodge")+
  scale_fill_brewer(palette = 1)+
  theme(panel.background = element_blank())+
  theme_classic()+
  ggtitle("Number of Member vs Customer By Day of the Week")+
  xlab("Day of the Week")+
  ylab("Number of Customers")

## no of rides per rider by day of the week
bike_rides_clean%>%
  group_by(member_casual, week_day)%>%
  summarise(ride_id = n()
            , .groups = "drop")%>%
  ggplot(aes(y=ride_id, x=week_day, fill= member_casual))+
  geom_col(position = "dodge")+
  scale_fill_manual(values = c("#B25068", "tan"))+
  theme(panel.background = element_blank())+
  theme_classic()+
  ggtitle("Number of Member vs Customer By Day of the Week")+
  xlab("Day of the Week")+
  ylab("Number of Customers")

## no of rides per rider by month
bike_rides_clean%>%
  group_by(member_casual, month_name)%>%
  summarise(mean_ride_length = mean(ride_length)
            ,ride_id = length(ride_id)
            , .groups = "keep")%>%
  ggplot(aes(y=ride_id, x=month_name, fill= member_casual))+
  geom_col(position = "dodge")+
  scale_fill_manual(values = c("#B25068", "tan"))+
  theme(panel.background = element_blank())+
  theme_classic()+
  ggtitle("Number of Member vs Customer By Month")+
  xlab("Month Name")+
  ylab("Number of Customers")

##avg ride length per customer
aggregate(ride_length ~ member_casual, data = bike_rides_clean, mean)%>%
  ggplot(aes(y=ride_length, x="", fill=member_casual)) +
  geom_bar(stat= 'identity', width=1) + 
  coord_polar("y", start=0) +
  theme_void()+
  scale_fill_manual(values = c("#B25068", "tan"))+ 
  labs(title = "Average Customer Trip Length", size =10) 

#Average Customer Trip Length by Month
bike_rides_clean %>%
  group_by(member_casual, month_name)%>%
  summarise(mean_ride_length = mean(ride_length)
            ,ride_id = n())%>%
  ggplot(aes( y=mean_ride_length, x= month_name, fill = member_casual))+
  geom_col(position = 'dodge')+
  scale_fill_manual(values = c("#B25068", "tan"))+
  theme(panel.background = element_blank())+
  ggtitle("Average Customer Ride Length by Month")+
  xlab("Month")+
  ylab("Average Ride Length") 

###Average Customer Trip Length by week day
bike_rides_clean%>%  
  group_by(member_casual, week_day)%>%
  summarise(ride_id = n()
            ,mean_ride_length = mean(ride_length)
            , .groups = "drop")%>%  
  ggplot(aes(y=mean_ride_length, x=week_day, fill= member_casual))+
  geom_col(position = 'dodge')+
  scale_fill_manual(values = c("#B25068", "tan"))+
  theme_classic()+
  ggtitle("Average Customer Trip Length by Day of the Week")+
  xlab("Day of the Week")+
  ylab("Average Customer Ride Length") 

###Average Customer Trip Length by hour of the day
bike_rides_clean%>%  
  group_by(member_casual, hour_of_day)%>%
  summarise(ride_id = n()
            ,mean_ride_length = mean(ride_length)
            , .groups = "drop")%>%
  ggplot(aes(y=mean_ride_length, x=hour_of_day, fill= member_casual))+
  geom_col(position = 'dodge')+
  scale_fill_manual(values = c("#B25068", "tan"))+
  theme_classic()+
  ggtitle("Average Customer Trip Length by Hour of the Day")+
  xlab("Hour of the Day")+
  ylab("Average Customer Ride Length")

# Number of Customer by Hour
aggregate(ride_id ~ member_casual + hour_of_day, data = bike_rides_clean, length)%>%
  ggplot(aes(y=ride_id, x=hour_of_day, fill = member_casual))+
  geom_col(position ='dodge')+
  scale_fill_manual(values = c("#B25068", "tan"))+
  theme(panel.background=element_blank())+
  ggtitle("Number of Customers by Hour of Day")+
  xlab("Hour of Day")+
  ylab("Number of Customer")

## no of customer 
aggregate(ride_id ~ member_casual, data = bike_rides_clean, length)%>%
  ggplot(aes(y=ride_id, x="", fill=member_casual)) +
  geom_bar(stat= 'identity', width=1) + 
  coord_polar("y", start=0) +
  theme_void()+
  scale_fill_manual(values = c("#B25068", "tan"))+ 
  labs(title = "Average Customer no", size =10) 

 head(hourly_riders)          

 ggplot(data = hourly_riders) + geom_point(mapping = aes(x = hour_of_day,
                        y = ride_id, color = member_casual))
 
                                           
                                           
                                           

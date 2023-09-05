###DATA EXPLORATION##
###Set your working directory######
#####   setwd( "C:/.......")  ######
getwd()
setwd("C:/Users/apple/Desktop/R PROG PRACTICE FILES")

##TIDYVERSE
library(tidyverse) ## to load the tidyverse package####

data() ## views the entire R datasets inside the tidyverse package####
view(mpg) ## this views the table containing the mpg data####
?mpg ## this is the definintion page in R showing the information about mpg data set####
?mean ## this shows the definition of the mean command ####
glimpse(mpg) ## this shows a glimpse of the dataset####
view(mpg)

####DATA CLEANING AND TRANSFORMATION
filter(mpg, cty>20) ## this returns only information from the mpg that has cty>20 only####

mpg_efficient<-filter(mpg, cty>20) ## this stores the filtered data into the environment as mpg_efficient#### 

view(mpg_efficient) ## this will view the data in the filtered value that was named as mpg_efficient####
mpg_ford<- filter(mpg, manufacturer== "ford") ## this takes only the data that has the manufacturer as "ford"

mpg_ford #### returns the saved data mpg_ford.

mpg_metric<- mutate(mpg, cty_metric = 0.425144 * cty) ## creates additional table/row named mpg_metric in km###

glimpse(mpg_metric)

#### using the pipe operator in R##
### the pipeoperator takes a column in the data to analyse##
## the shortcut on the keyboard is to press ctrl+shift+m##

mpg_metric<- mpg %>%
  mutate(cty_metric = 0.425144 * cty) %>% ##
  view
mpg %>% 
  group_by(class) %>%  ### this returns only the grouped data by class##
     summarise(mean(cty), median(cty))  ## this returns the mean of cty by summarising it####


##data visualisation with ggplot2##

ggplot(mpg,aes(x=(cty)))+ ## this assigns cty to x-axis#
  geom_histogram()+ ## plots with histogram
  labs(x= "city mileage")## labels/name the x-axis as city mileage

ggplot(mpg,aes(x=(cty)))+
  geom_freqpoly()+ #plots with freqpoly
  labs(x= "city mileage")

ggplot(mpg,aes(x=(cty)))+ ## this assigns cty to x-axis#
  geom_histogram()+ ## plots with histogram
 geom_freqpoly()## and freqpoly graph
  labs(x= "city mileage")
  
ggplot(mpg, aes(x=(cty), y =hwy))+## this assigns the x and y labels respectively
  geom_point()+ ## plots using the geom_point in ggplot
  geom_smooth(method = "lm")

ggplot(mpg, aes(x=cty,
                y =hwy, ##this assigns the x and y labels respectively
                color= class))+##then labels the point as class using colors 
  geom_point()+
  scale_color_brewer(palette = "Dark2")## to change the color palette to second dark


## communicating the report


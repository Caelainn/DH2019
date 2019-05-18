################
## R_CLASS_II ##
################

#In this class we'll get down to some data wrangling and learn how join and subset datasets in R
#You'll also learn statistical functions in R

#In this class we'll look at:
#1. Joining data
#2. Subsetting data
#3. Getting the average
#4. Putting together a story

####################
##1. Joining data ##
####################

#We've been working with a dataset in the previous session
#As we started a new session, let's load in the previous data...
genderpayjan <- read.csv("genderpay300118.csv") 

#But what if we want to join another dataset to that data?
#Let's load the data set in and look at it
genderpayapril <- read.csv("genderpay040418.csv")

#Take a look at the data
View(genderpayapril)

#The structure is exactly the same as the existing dataset
#The column headers match up so let's append the rows
#We'll use the bind_rows command, a function of dplyr

library("dplyr")
allgenderpay <- bind_rows(genderpayjan,genderpayapril)

#What does the error message mean?

#There are numerous join functions that can allow you to extract data
#Compare files to see new entries 
#newentriesgenderpay <- anti_join(newdata, olddata, by="VARIABLE")
#What are the possible shortcomings with this command?

newentriesgenderpay <- anti_join(genderpayapril, genderpayjan, by="EmployerName")

#This is known as a filtering join as it creates a new data set
#semi_join is also a filtering join
#dplyr::semi_join(a, b, by = "x1")
#All rows in a that have a match in b

#We used this command a lot to run our gender pay gap coverage in 2018

#Some other mutating join functions are:
#left_join, right_join, inner_join and full_join
#What makes it a mutating function?

#left_join
#dplyr::left_join(a, b, by = "x1")
#join matching rows from b to a

#right_join
#dplyr::right_join(a, b, by = "x1")
#join matching rows from a to b

#inner_join
#dplyr::inner_join(a, b, by = "x1")
#join data. Retains only rows in both sets

#full_join
#dplyr::full_join(a, b, by = "x1")
#join data. Retain all values, all rows

#######################
## 2.Subsetting data ##
#######################

#There are a few ways to subset data
#One of the most straightforward is to name the data by location
#This can then be saved to a new dataframe
headsingle_allgenderpay <- allgenderpay[ ,-(5:7)]

#Or we can name the data we want to keep
onlypay_allgenderpay <- allgenderpay[, 1:4]

#Or we can name the column headers we want to keep
#Also there are many ways to get the same results...
myvars <- c("EmployerName", "DiffMedianHourlyPercent", "DiffMedianBonusPercent")
gap_allgender <- allgenderpay[myvars]

###########################
## 3.Getting the average ##
###########################

#Let's look at some quick ways of finding headlines

#Let's look at the median value of our new dataset
median(allgenderpay$DiffMedianHourlyPercent)

#Let's look at the mean value of women in the top quartile across all companies 
mean(genderpayapril$FemaleTopQuartile)

#and take a look at the outliers
min(allgenderpay$DiffMedianHourlyPercent)
max(allgenderpay$DiffMedianHourlyPercent)

################################
## 4.Putting together a story ##
################################

#What else might we want to consider when looking at the data for storylines?
#Work together to come up with five storylines from the new gender pay gap data
#Consider some of the functions, filter and sort, we learned in the previous session as well

###################
## Caelainn Barr ##
## The Guardian  ##
## @caelainnbarr ##
###################
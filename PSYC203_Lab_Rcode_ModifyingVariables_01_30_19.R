###############################################################################
############################## WORKING DIRECTORY ##############################
###############################################################################
# A working directory (WD) is a folder or location on your computer that R will automatically read files from and write files to
# First, check to see what the current WD is by using the getwd() function:
getwd()
setwd("~/Dropbox/PSYC203_Spring_2019")
# Next, create a folder and put it where you want the WD to be
### Give the folder a simple name that applies to what you are working on, such as "PSYC203_Spring_2019"
# This will be useful if/when you have many different projects you work on in R
# Once you have a folder you want to use as the WD, use setwd() function to set it as the WD:

###### Setting the WD requires the file path -- You can copy this and paste it into R ######
### Windows: hold down shift, right click the folder you want to set as the WD, select "copy as path"
### Mac (older versions): right click on the folder you want to be the WD, select "get info", go to the "General" section, right click the text to the right of "where", copy
### Mac (Mojave):
# 1. In finder, open the "View" drop down menu and select "Show Path Bar" (leave if it says "Hide Path Bar")
# 2. Locate the folder you want to set as your WD and highlight (click/select) it
# 3. The file path for the WD folder should now be visible at the bottom of the Finder window with WD folder at the end of the path
# 4. In the file path at the bottom of the Finder window, right click the WD folder and select "Copy [WD folder] as Pathname"

# Once you have the file path copied you paste it into the setwd() function:
### NOTE: Windows file paths paste with single backslashes ( \ ), but R only recognizes double backslashes ( \\ ) and single forward slashes ( / ) ###
## YOU MUST CHANGE WINDOWS FILE PATH SINGLE BACKSLASHES TO SINGLE FORWARD SLASHES OR DOUBLE BACKSLASHES ##
### The file path on this device (a Mac) for my flashdrive pastes into R as: /Volumes/FlashDrive/PSYC203_Spring_2019 
## NOTE: You MUST have quotations around a file path but Mac does not paste with quotations so you must add them as I do below:
setwd("~/Dropbox/PSYC203_Spring_2019")    # Note that file path is in quotation marks and has single forward slashes
#!!!!!!!!!!!!!!!!!!!!!!!!!!!! CHANGE ABOVE FILE PATH TO YOUR OWN TO RUN THIS CODE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#oops yes I already did
# Use getwd() function to make sure you set it to the correct WD:
getwd()
# Once the WD is set you can easily pull files from or write files to that WD
# We want to read in the data from the survey you all completed for lab:


###############################################################################
############################# IMPORTING DATA FILES ############################
###############################################################################
#First, make sure the file is saved in your Working Directory (WD) folder in a format that R can read.
#In this case, the file is a CSV (comma-separated value) file created with Google Sheets named "203LabSurvey_January22_2019.csv"
#To import it, we use the read.csv() function and assign it to the object 'mydata' by referencing the file by name:
mydata <- read.csv("203LabSurvey_January22_2019.csv")
#!!!!!!!!!!!!! MAKE SURE IT IS EXACTLY THE SAME AS IN YOUR WORKING DIRECTORY !!!!!!!!!!!!!!!!!!!!!!!
### Don't forget quotation marks and be sure to include the file type (.csv) at the end ###

#After we have the data file read in, we can see the data with the View() function:
View(mydata)

#To see the structure of the data set we can use the str() function:
str(mydata)


###############################################################################
############################### DATA TYPES ####################################
###############################################################################
#Each variable is considered to be of a particular type
#Common types are: character, numeric, integer, factor
#Note: an integer is also considered numeric

#You can find out what type of data you have using class()
#R refers to variables using the notation 'dataframe$variable'
class(mydata$Duration)

#Important - These two things are not the same:
class(mydata$Duration)
class(Duration)

#One refers to the column 'Duration' in the data set called 'mydata'
#The other refers to the object 'Duration'

#The moral:
#1) Know what you are referring to
#2) Keep a clean workspace

#You can change the 'class' of an object using as.nameOfClass()
#For example mydata$Duration is numeric (integer):
#You can make it text using as.character():
mydata$Duration <- as.character(mydata$Duration)
class(mydata$Duration)
mydata$Duration
#Notice the quotes around all the numbers because they are recognized as characters now

#You probably want it as numeric so let's turn it back
mydata$Duration <- as.numeric(mydata$Duration)
class(mydata$Duration)
mydata$Duration
#Don't forget to assign it back to the data set or things won't behave correctly!

#For example:
as.character(mydata$Duration) #no assignment operator
class(mydata$Duration)
#Note that the class is still numeric.
mydata$Duration  #no quotes either b/c still numeric
#Because you didn't assign as.character(mydata$Duration) back into the object (mydata)...
#R prints characters in the console but never changes the underlying data
#THIS IS AN IMPORTANT LESSON#
#WHEN YOU WANT TO CHANGE THE DATA YOU MUST ASSIGN THAT CHANGE SOMEWHERE (e.g. back to the data set or to a new object) OR THAT CHANGE WILL NOT BE SAVED


###############################################################################
########################### ACCESSING DATA IN R ###############################
###############################################################################
#First, let's learn how to manipulate vectors in R:
vector1 <- c(1,3,5,7,9,11,13,15) #creates vector1 and assigns those values to it
vector1 #prints vector1
#Had to redo every action because my app closed for some reason
vector2 <- vector1 #creates a copy of vector1 named vector2
vector2 #prints vector2

#You can refer to different parts of a vector using square brackets []
vector1    #prints all the values
vector1[2] #print out the value in the second position
vector1[4] #print out the value in the fourth position

#the minus sign can be used here and it means 'except':
vector1[-4] #print out all the values except the one in the fourth position

#you can print out values in multiple positions
vector1[c(2,4,6)]

#or all the values except certain ones
vector1[-c(2,4,6)]

#I can also use the same code to change certain values
vector2[1] <- 0  #Let's change the value in the first position of vector2
vector2

vector2[-1] <- 2 #Change all the values except the first one
vector2

vector2[c(2,4,6)] <- 8 #change multiple values
vector2

vector2[-c(2,4,6)] <- 4 #change values except certain ones
vector2

#Now let's learn how to uses some basic functions:
mean(vector1)
min(vector1)
max(vector1)
sum(vector1)
length(vector1) #how many scores

#How do logical operators work?
vector2
max(vector2)

#Which positions have the max value?
vector2 == 8 
#Notice the double equal sign? 
#Remember single '=' means '<-'. 
#Double equal sign is a logical operator. 
#R tests each value in the vector and returns either TRUE or FALSE. 
#TRUE and FALSE are considered 1 and 0 respectively. 
#We can use this to learn how many 8's (max values) there are:
sum(vector2==8)

#I can find out where they are using the which() function
which(vector2==8)

#and you can combine commands
which(vector2==max(vector2))

################################
#You can use the same techniques on a data frame
#Here is a review of what we just learned about entering data directly in R:
#create a column vector using the concatenate function c()
age <- c(25, 30, 56)                    #creates a variable called 'age' with these 3 values
gender <- c("male", "female", "male")   #creates a variable called 'gender' with these 3 values 
#Notice the "" around male and female since this variable is not numeric
weight <- c(160, 110, 220)              #creates a variable called 'weight' with these 3 values
#Right now these 3 variables are separate. We now want to put them together in a data set.
#We do that by creating a dataframe (i.e. dataset - matrix of multiple column vectors)
myFirstDataset <- data.frame(age,gender,weight) 
#Now let's select parts of this data frame

#You can use the same techniques on a data frame
#Remember data frames have rows and columns so you need to refer to both
myFirstDataset[1,2] #selects row 1 and column 2
myFirstDataset[-1,-2]#Selects all but row 1 and column 2
myFirstDataset[1:2,2:3]#Selects rows 1 to 2 and column 2 to 3

#Here is a variation on something from above
#What if you want all the columns except for column 2
myFirstDataset[1:3,-2]#Selects all rows  and all columns except column 2
#A simpler way is to omit the "1:3" like so
myFirstDataset[ ,-2] #Selects all rows  and all columns except column 2
#Blank is short for all of that dimension

#You can also use column names to subset:
myFirstDataset[ , "age"] # prints values of column 'age'
#Notice the quotes since "age" is a column name

#You can select multiple columns using the same format as above
myFirstDataset[ , c("age", "gender")] 

#Or assign those columns to a new data set:
newData <- myFirstDataset[ , c("age", "gender")]
#Nothing is printed, but a new object is created in your workspace

#Subsetting is critical because it is used to interact with your data, especially whenever you want to apply an action (e.g. a function) on multiple variables. 
#For example, if I want a summary of these two variables, I would use subsetting in combination with the summary() function.
summary(myFirstDataset[ , c("age", "gender")])
#R will print summary stats for both variables

#You can use logical operators to subset your data:
#Let's use mydata and reference the question about majors:
PsychMajor <- mydata[mydata$Major == "Psychology Major", ]
PsychMajor
#The above command says: create a new data set called 'PsychMajor' that only includes responses for all psychology majors in the class
#This new data set comes from 'mydata' and uses the rows of responses from people who are psych majors (notice the double equal signs '==' ) 
#Notice the comma after "Psychology Major": There is nothing specified after this comma because we are selecting all columns. Don't forget the comma!

#What is happening here? Let's look at just the logical operator:
mydata$Major == "Psychology Major"
#R checks every row of the question on major to see if it is they responded as being a psychology major. If it is, R returns True. 
#R can then use TRUE/FALSE to extract values from a data frame

#You can combine logical operators:
##### AND #####
FastandPsychMajor <- mydata[mydata$Major == "Psychology Major" & mydata$Duration < 500, ]
FastandPsychMajor

##### OR #####
FastorPsychMajor <- mydata[mydata$Major == "Psychology Major" | mydata$Duration < 500,]
FastorPsychMajor

#Notice the '&' symbol is used as the "and" operator and "|" is used as the "or" operator !!!!!!!


#Now you can perform actions on these subsets of participants:
mean(mydata$Duration) #to use all the data
mean(PsychMajor$Duration)  #to use just psych majors
mean(FastandPsychMajor$Duration) #to use just psych majors that completed the survey quickly

#I performed the actions above in multiple steps:
#Step 1: pull out participants I want
#Step 2: ask for the mean
#I could do that all at once:

mean(mydata[mydata$Major == "Psychology Major" & mydata$Duration < 500,]$Duration)

#This code: mydata[mydata$Major == "Psychology Major" & mydata$Duration < 500, ] is equivalent to the object: FastandPsychMajor

#I could also do it without the $ notation
mean(mydata[mydata$Major == "Psychology Major" & mydata$Duration < 500,"Duration"])
#But notice the slightly different format where "Duration" is in quotes and is inside the square brackets after the newly added comma


###############################################################################
#################### SELECTING CASES & RECODING VARIABLES #####################
###############################################################################
#Recoding data
#The simplest kind of recode involves reverse-scoring a negatively phrased item. This can be done as follows (assuming a 5 point scale)
#You can use what you learned about computing variables to do this:
mydata$newIIT_1 <- 6 - mydata$IIT_1
#If IIT_1 was previously a '5', now it is a '1', and if it was a '1', now it is a '5', '4' is a '2', '3' stays a '3'.
#If you are confident in your recode, you can replace the original variable instead of creating a new one like:
#mydata$IIT_1 <- 6 - mydata$IIT_1
#I am not running the above code because this variable should not be recoded.
#I am also going to delete the recoded column we created to keep the data set clean:
mydata$newIIT_1 <- NULL

#####################################
#If you need to recode something and can't do it with a computation, the 'ifelse' command is extremely useful for all sorts of recoding you might want to do. 

#Here is a simple example:
#Say you want to compare fast vs. slow survey response time groups.
#It would be helpful if you had a variable denoting who was fast and slow in completing the survey. This can be done as follows:
mydata$FastSlow <- ifelse(mydata$Duration < 500, "Fast", "Slow")
mydata$FastSlow
#The ifelse command says the first argument is true then do what follows after the first comma (Fast)
#If it is false then do what is after the second comma (Slow)

#You can combine the above with other variables as well.
mydata$FastPsychMajor <- ifelse(mydata$Major == "Psychology Major" & mydata$Duration < 500, "Yes", "No")
mydata$FastPsychMajor

# This '&' means and
# This '|' means or


###############################################################################
#################### INTRODUCTION TO R -- LAB DATA RECODE #####################
###############################################################################
#We want to recode the data for the MOVIE TRIVIA items A1 through A15 so that each response is either 0 (incorrect answer) or 1 (correct response):
#This is the answer key:
##### Correct answer A: Items = A4, A7, A11, A13
##### Correct answer B: Items = A3, A12, A14
##### Correct answer C: Items = A1, A5, A6, A8, A10, A15
##### Correct answer D: Items = A2, A9

#First, let's look at the data set and remove any unnecessary variables we created:
head(mydata) #shows us the first few rows so we can look for unnecessary variables
mydata$FastSlow <- NULL #removes variable
mydata$FastPsychMajor <- NULL

#Next, we use the ifelse() function along with square brackets to recode groups of variables like so:
head(mydata)
mydata[ , c("A4", "A7", "A11", "A13")] <- ifelse(mydata[ , c("A4", "A7", "A11", "A13")] == "A", 1, 0)
mydata[ , c("A3", "A12", "A14")] <- ifelse(mydata[ , c("A3", "A12", "A14")] == "B", 1, 0)
mydata[ , c("A1", "A5", "A6", "A8", "A10", "A15")] <- ifelse(mydata[ , c("A1", "A5", "A6", "A8", "A10", "A15")] == "C", 1, 0)
mydata[ , c("A2", "A9")] <- ifelse(mydata[ , c("A2", "A9")] == "D", 1, 0)
head(mydata)

#Now, we want to create a new variable that is the sum of all the movie trivia items:
mydata$MovieTrivia <- with(mydata, A1+A2+A3+A4+A5+A6+A7+A8+A9+A10+A11+A12+A13+A14+A15) 
# we use the with() function to specify which data set and then can just write out the variable names with + between to indicate we want them added together
head(mydata) # we should be able to see the new item if we look quickly at the first few rows of the data frame

#Recode items B3, B4, B8, B10, and B12 from section B such that (1=5), (2=4), (4=2), (5=1):
#We this out as "6 - score on item" because it was a 5 point scale and we want to reverse code them:
mydata$B3 <- 6 - mydata$B3
mydata$B4 <- 6 - mydata$B4
mydata$B8 <- 6 - mydata$B8
mydata$B10 <- 6 - mydata$B10
mydata$B12 <- 6 - mydata$B12
head(mydata) # we should see the changes if we look at the first few rows
#Make sure you only run this code once!!!!!!!!!!!!!!
#If you run it twice for the same variable it will bring it back to the original value.

#Now, we want to create a new variable that is the average of items from section B:
#It is simplest to first create a subset of the B items:
B.items <- subset(mydata, select = B1:B13) #here we are saying use the mydata data frame and select items B1 through B13 to create object B.items
head(B.items)
mydata$StatsEfficacy <- rowMeans(B.items) #Here we are using the rowMeans function on the B.items subset to create a new variable called 'StatsEfficacy' in the mydata data frame 
head(mydata) #we should see that new item here if we look at the first few rows

# Now, we have a data set (mydata) that includes:
### The 'A' (movie trivia) items recoded to correct (1) and incorrect (0)
### The 'B' (stats efficacy) items 3, 4, 8, 10, and 12 reverse scored
### A Movie Trivia Scale Score variable we created (MovieTrivia) which is the sum of the recoded 'A' items (i.e., total movie trivia score)
### A Stats Efficacy Scale Score variable we created (StatsEfficacy) that is the mean of the appropriately scored 'B' items (i.e., average stats efficacy score)


###############################################################################
############################## EXPORTING DATA #################################
###############################################################################
#Simple command to export to a comma separated values (CSV) file:
write.csv(mydata, file = "203LabSurvey_Modified.csv", row.names = TRUE)

#above command says ...
#Create a csv file - 'write.csv' command - from the R data frame called 'mydata' and save in WD as a new file called "203LabSurvey_Modified.csv".
#Make sure the name of the new file is different from the original file name. R will overwrite any file with the same name
#This data file can be easily read back into R later using an import script
#You can also open it in excel, numbers, or google sheets to view it
#Your original data file should be the same as it was before and you can reload that into R to do this all over again or check for errors if you want
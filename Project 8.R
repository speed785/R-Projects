#Set working directory! 
getwd()
setwd("~/Desktop/R-Projects")

install.packages("pacman")
pacman::p_load(apaTables)


Proj8 <- read.csv("PROJ8FA18.csv")
View(Proj8)


#Can create scatter plots individually:
plot(Proj8$CHAPTERS, Proj8$ATTEND, main= "Chapters Read Vs. Lectures Attended", xlab = "Chapters Read" , ylab = "Lectures Attended")
plot(Proj8$CHAPTERS, Proj8$GRADE, main = "Chapters Read Vs. Final Grade", xlab ="Chapters Read", ylab = "Final Grade")
plot(Proj8$ATTEND, Proj8$GRADE, main = "Lectures Attended Vs. Final Grade", xlab ="Lectures Attended", ylab = "Final Grade")


#Can create a scatter plot matrix:
help(pairs)
pairs(~CHAPTERS+ATTEND+GRADE, data = Proj8, main = "Project 8 scatterplot Matrix")


#Can calculate correlation:
cor(Proj8, method = "pearson")

#Compute correlations between the three variables and report in correlation table in APA format:
#Here, we use a function to create an APA style correlation table from the apaTables package already installed and loaded:
apa.cor.table(Proj8, filename = "Project 8 APA style Correlation Table", table.number = NA, show.conf.interval = TRUE, landscape = TRUE)
###########
#PART 2###
#########

#Number of Strikes in Us Manufacturing Data
Proj8.2 <- read.csv("StrikeNb.csv")
View(Proj8.2)


#Can create scatter plots individually:
plot(Proj8.2$strikes, Proj8.2$output, main= "Strikes Vs. Output", xlab = "Strikes" , ylab = "Output")
plot(Proj8.2$strikes, Proj8.2$time, main = "Strikes Vs. Time", xlab ="Strikes", ylab = "Time")
plot(Proj8.2$output, Proj8.2$time, main = "Output Vs. Time", xlab ="Output", ylab = "Time")


#Can create a scatter plot matrix:
help(pairs)
pairs(~strikes+output+time, data = Proj8.2, main = "Project 8.2 scatterplot Matrix")


#Can calculate correlation:
cor(Proj8.2, method = "pearson")

#Compute correlations between the three variables and report in correlation table in APA format:
#Here, we use a function to create an APA style correlation table from the apaTables package already installed and loaded:
apa.cor.table(Proj8.2, filename = "Project 8.2 APA style Correlation Table", table.number = NA, show.conf.interval = TRUE, landscape = TRUE)
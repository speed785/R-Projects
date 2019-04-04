#Set working directory! 
getwd()
setwd("~/Desktop/R-Projects")

install.packages("pacman")
pacman::p_load(apaTables)


Proj8 < read.csv("PROJ8FA18.csv")
View(Proj8)


#Can create scatter plots individually:
plot(Proj8$CHAPTERS, Proj8$ATTEND, main= "Chapters Read Vs. Lectures Attended", xlab = "Chapters Read" , ylab = "Lectures Attended")


#Can create a scatter plot matrix:
help(pairs)
pairs(~CHAPTERS+ATTEND+GRADE, data = Proj9, main = "Project 8 scatterplot Matrix")


#Can calculate correlation:
cor(Proj8, method = "pearson")

#Compute correlations between the three variables and report in correlation table in APA format:
#Here, we use a function to create an APA style correlation table from the apaTables package already installed and loaded:
apa.cor.table(Proj8, filename = "Project 8 APA style Correlation Table", table.number = NA, show.conf.interval = TRUE, landscape = TRUE)
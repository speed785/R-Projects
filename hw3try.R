aics.freq <- transform(table(aics)) #transform internet users into a freq table
#Begin data set information#
require(graphics)
work <- diff(WWWusage)
par(mfrow = c(2, 1)); plot(WWWusage); plot(work)
## Not run: 
require(stats)
aics <- matrix(, 6, 6, dimnames = list(p = 0:5, q = 0:5))
for(q in 1:5) aics[1, 1+q] <- arima(WWWusage, c(0, 1, q),
                                    optim.control = list(maxit = 500))$aic
for(p in 1:5)
  for(q in 0:5) aics[1+p, 1+q] <- arima(WWWusage, c(p, 1, q),
                                        optim.control = list(maxit = 500))$aic
round(aics - min(aics, na.rm = TRUE), 2)
bins <- seq(5,100, by=10)
## End(Not run)
#End of data set information#

##Histogram attempt
##x=read.csv("Macintosh HD⁩ ▸ ⁨Users⁩ ▸ ⁨James⁩ ▸ ⁨Dropbox⁩ ▸ ⁨Psych 203⁩")
##attach(x)
# will not read my excel data set for some reason


Internet_usage=diff(Agrif)
summary(Internet_usage)

##########################################
hist(WWWusage)

hist(WWWusage, breaks = 50, xlim = c(0,250),
     xlab = "Internet Users", ylab = "Frequency", main = "Histogram of Internet Usage per Minute")







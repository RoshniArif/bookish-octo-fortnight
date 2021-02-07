library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )
RNGkind("Mersenne-Twister", "Inversion", "Rejection")
head(x)
mean(x)
set.seed(1)
abs(mean(sample(x, 5)) - mean(sample(x, 5)))
set.seed(5)
abs(mean(sample(x, 5)) - mean(x))
set.seed(1)
n <- 1000
averages5 <- vector("numeric",n)
for(i in 1:n){
  X <- sample(x,5)
  averages5[i] <- mean(X)
}
hist(averages5) ##take a look
mean( abs( averages5 - mean(x) ) > 1)

set.seed(1)
n <- 10000
averages5 <- vector("numeric",n)
for(i in 1:n){
  X <- sample(x,5)
  averages5[i] <- mean(X)
}
hist(averages5) ##take a look
mean( abs( averages5 - mean(x) ) > 1)

## Normal Distribution ##
mean(x)
set.seed(1)
abs(mean(sample(x, 5)) - mean(sample(x, 5)))
set.seed(5)
abs(mean(sample(x, 5)) - mean(x))
n <- 1000
averages5 <- vector("numeric",n)
set.seed(1)
for (i in 1:n) {
  averages5[i] <- mean(sample(x, 5))
}
mean(abs(averages5 - mean(x)))

n <- 10000
null <- vector("numeric",n)
set.seed(1)
for (i in 1:n) {
  null[i] <- mean(sample(x, 5))
}
mean(abs(null - mean(x)))
n <- 1000
averages50 <- vector("numeric",n)
set.seed(1)
for (i in 1:n) {
  averages50[i] <- mean(sample(x, 50))
}
mean(abs(averages50 - mean(x)))
hist(averages5)
hist(averages50)
mean(averages50 > 23 & averages50 < 25)
pnorm(25, 23.9, 0.43) - pnorm(23, 23.9, 0.43)
sessionInfo()
knitr::write_bib(.packages(), "packages.bib") 
##Normal DIstribution Exercises


install.packages("gapminder")
library(gapminder)
data(gapminder)
head(gapminder)
dat1952 = gapminder[ gapminder$year == 1952, ]
x = dat1952$lifeExp
mean(x <= 40)
prop = function(q) {
  mean(x <= q)
}
qs = seq(from=min(x), to=max(x), length=20)
props = sapply(qs, prop)
plot(qs, props)
props = sapply(qs, function(q) mean(x <= q))
plot(ecdf(x))
# make averages5
set.seed(1)
n <- 1000
averages5 <- vector("numeric",n)

for(i in 1:n){
  X <- sample(x,5)
  averages5[i] <- mean(X)
}

# make averages50
set.seed(1)
n <- 1000
averages50 <- vector("numeric",n)
for(i in 1:n){
  X <- sample(x,50)
  averages50[i] <- mean(X)
}
hist(averages5, xlim=c(18,30))
hist(averages50, xlim=c(18,30))

mean( averages50 < 25 & averages50 > 23)

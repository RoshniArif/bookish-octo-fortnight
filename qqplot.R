load("skew.RData")
dim(dat)
par(mfrow = c(3,3))
for (i in 1:9) {
  # **put your qqnorm call here**
  x <- dat[,i]
  qqnorm(x,  main=paste0("Q-Q plot for column V.",i,sep=""))
  qqline(x)
}
yy <- dat[,4]
hist(dat[,4])
hist(dat[,9])

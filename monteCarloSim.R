set.seed(seed=1)
sample <- rnorm(n=5)
sample
sqrt(length(sample))*(mean(sample)) / sd(sample)
t.test(sample)$statistic
set.seed(1)
B=100
ps = seq(1/(B+1), 1-1/(B+1),len=B)
par(mfrow=c(2,2))
for(samplesize in c(3,10,100,1000)) {
  mc <- replicate(1000, t.test(rnorm(n=samplesize))$statistic)
  qqplot(qt(ps,df=samplesize-1), qt(mc, df=samplesize-1), 
         main=paste("n=",samplesize,sep=""),
         ylim=c(-6,6),
         xlim=c(-6,6))
  abline(0,1)
}
set.seed(1)
B=100
ps = seq(1/(B+1), 1-1/(B+1),len=B)
par(mfrow=c(2,2))
for(samplesize in c(3,10,100,1000)) {
  mc <- replicate(1000, t.test(rnorm(n=samplesize), rnorm(n=samplesize), var.equal=T)$statistic)
  qqplot(qt(ps,df=2*samplesize-2), qt(mc, df=2*samplesize-2), 
         main=paste("n=",samplesize,sep=""),
         ylim=c(-6,6),
         xlim=c(-6,6))
  abline(0,1)
}
set.seed(1)
B=100
ps = seq(1/(B+1), 1-1/(B+1),len=B)
par(mfrow=c(1,1))
samplesize <- 15
#mc <- replicate(1000, t.test(rbinom(n=samplesize,size=1,prob=0.5))$statistic)
#mc <- replicate(1000, t.test(rbinom(n=samplesize,size=1,prob=0.5), rbinom(n=samplesize,size=1,prob=0.5), var.equal=T)$statistic)
#sanity test, this is the same as above
mc <- rep(0, times=1000)
for(i in 1:1000) {
  X <- rbinom(n=samplesize,size=1,prob=0.5);
  mc[i] <- sqrt(samplesize)*mean(X) / sd(X)
}
hist(unlist(mc))
#qqplot fails because of NAs in qt. 
tryCatch({
  qqplot(qt(ps,df=samplesize-1), qt(mc, df=samplesize-1), 
         main=paste("n=",samplesize,sep=""),
         ylim=c(-6,6),
         xlim=c(-6,6))
  abline(0,1)
},
error=function(e){print(e)})
hist(mc)

set.seed(1)
B=100
ps = seq(1/(B+1), 1-1/(B+1),len=B)
par(mfrow=c(1,1))
samplesize <- 500
#reality check using formula for t statistic
set.seed(1)
X <- replicate(1000, rbinom(n=samplesize, size=1, prob=0.5))
mc <-  apply(X, 2, FUN=function(X){(mean(X) * sqrt(samplesize)/ sd(X))})
hist(mc)
set.seed(1)
mc <- replicate(1000, t.test(rbinom(n=samplesize, size=1, prob=0.5))$statistic)
#Can't even get a qq plot to work here. 
#qqplot(qt(ps,df=samplesize-1), qt(mc, df=samplesize-1), 
#       main=paste("n=",samplesize,sep=""),
#       ylim=c(-6,6),
#       xlim=c(-6,6))
#abline(0,1)
table(mc)
samplesize <- 500
mc <- replicate(1000, t.test(rbinom(n=samplesize,size=1,prob=0.5))$statistic)
#sanity test, this for loop is the same as above replicate call
#mc <- rep(0, times=1000)
#for(i in 1:1000) {
#  X <- rbinom(n=samplesize,size=1,prob=0.5);
#  mc[i] <- sqrt(samplesize)*mean(X) / sd(X)
#}
#hist(mc)
#qqplot fails because of NAs in qt. 
#qqplot(qt(ps,df=samplesize-1), qt(mc, df=samplesize-1), 
#       main=paste("n=",samplesize,sep=""),
#       ylim=c(-6,6),
#       xlim=c(-6,6))
#abline(0,1)
#so we'll just test it with a histogram - clearly not normal
hist(mc)

set.seed(1)
ttestgenerator <- function(n) {
  X <- rnorm(n)
  tstat <- (sqrt(n)*mean(X))/sd(X) 
  return(tstat)
}

ttests <- replicate(1000, ttestgenerator(5))
mean(ttests>=2)

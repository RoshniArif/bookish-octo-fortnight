url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)
bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist
library(rafalib)
mean(bwt.nonsmoke)-mean(bwt.smoke)
popsd(bwt.nonsmoke)
popsd(bwt.smoke)
B <- 10000
alpha <- 0.05
N <- 5
set.seed(1)
reject <- function(N, alpha=0.05){
  dat.ns <- sample(bwt.nonsmoke, N)
  dat.s <- sample(bwt.smoke, N)
  pval <- t.test(dat.s, dat.ns)$p.value
  pval < alpha
}
rejections <- replicate(B, reject(N))
mean(rejections)

Ns <- seq(30, 120, 30)
set.seed(1)
powers <- sapply(Ns, function(N) {
  rejections <- replicate(B, reject(N))
  mean(rejections)
})
names(powers) <- Ns
powers

Ns <- seq(30, 120, 30)
set.seed(1)
powers <- sapply(Ns, function(N) {
  rejections <- replicate(B, reject(N, alpha = 0.01))
  mean(rejections)
})
names(powers) <- Ns
powers

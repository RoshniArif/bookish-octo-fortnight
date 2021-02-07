msleep <- read.csv("msleep_ggplot2.csv")
library(dplyr)
nrow(msleep)
mprimates = filter(msleep, order == "Primates")
nrow(mprimates)
class(mprimates)
msleep %>% filter(order == "Primates") %>% select(sleep_total) %>% class
msleep %>% filter(order == "Primates") %>% 
  select(sleep_total) %>% unlist %>% mean
msleep %>% filter(order == "Primates") %>% summarize(avg_sleep = mean(sleep_total))
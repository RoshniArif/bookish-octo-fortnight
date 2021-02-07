head(InsectSprays)
boxplot( split(InsectSprays$count, InsectSprays$spray), main="split(values, factor version) version")
boxplot(InsectSprays$count ~ InsectSprays$spray, main="values ~ factor version")

library(dplyr)
data(nym.2002, package="UsingR")
in
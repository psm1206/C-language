#Continuous Variable (연속변수) - Numeric
#Categorical Variable (범주변수) - Factor/범주를 의미하는 levels 정보를 가지고 있음

var1 <- c(1, 2, 3, 1, 2)
var2 <- factor(c(1, 2, 3, 1, 2))
var1
var2

var1 + 2
var2 + 2
mean(var1)
mean(var2)

var2 <- as.numeric(var2)

var3 <- c("a", "b", "b", "c")
var3 <- as.factor(var3)

#p.331 exercise problem
mpg <- as.data.frame(ggplot2::mpg)
class(mpg$drv)
mpg$drv <- as.factor(mpg$drv)
levels(mpg$drv)

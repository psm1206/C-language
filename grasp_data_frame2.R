df <- data.frame(var1 = c(4, 3, 8),
                 var2 = c(2, 6, 1)
                 )
df

df$var_sum <- df$var1 + df$var2

df

df$var_mean <- (df$var1 + df$var2)/2

df

mpg$total <- (mpg$cty + mpg$hwy)/2

head(mpg)
mean(mpg$total)

hist(mpg$total)

mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")

head(mpg, 20)

table(mpg$manufacturer, mpg$test)
table(mpg$test, mpg$manufacturer)
table(mpg$test)

library(ggplot2)
qplot(mpg$test)

mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >= 20, "B", "C")
                    )
head(mpg,30)

table(mpg$manufacturer, mpg$grade)
qplot(mpg$grade)

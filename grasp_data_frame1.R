library(ggplot2)

mpg <- as.data.frame(ggplot2::mpg)

head(mpg, 80)
tail(mpg, 90)
View(mpg)
dim(mpg)
str(mpg)
summary(mpg)

?mpg

#변수명 바꾸기

df_raw <- data.frame(var1 = c(1, 2, 1),
                     var2 = c(2, 3, 2)
                     )
df_raw

install.packages("dplyr")
library(dplyr)

df_new <- df_raw
df_new <- rename(df_new, v2=var2)

df_new
df_raw

#p.112 practice problem

mpg <- as.data.frame(ggplot2::mpg)
mpg1 <- mpg
mpg1 <- rename(mpg1, city=cty, highway=hwy, transmission=trans, cylinder=cyl)
head(mpg1)
head(mpg)

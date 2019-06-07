setwd("C:/practice")

exam <- read.csv("csv_exam.csv")

exam[1, ]
exam[exam$class == 1,] #class가 1인 행 추출
exam[exam$math >= 80,]
exam[exam$class ==1 & exam$math >= 50, ]
exam1 <- exam[exam$english < 90 | exam$science < 50,]
exam[,1]
exam[,4]
exam[, "math"]
exam[exam$math > 50, "english"]
exam[exam$class == 1, c("english", "math")]

#p.324 exercise problem
mpg <- as.data.frame(ggplot2::mpg)
mpg$tot <- (mpg$cty + mpg$hwy)/2
mpg[mpg$class == "compact" | mpg$class == "suv", "tot"]

df_comp <- mpg[mpg$class == "compact", ]
df_suv <- mpg[mpg$class == "suv", ]
mean(df_comp$tot)
mean(df_suv$tot)

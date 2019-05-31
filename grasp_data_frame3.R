#p.123 practice problem

library(ggplot2)
midwest <- as.data.frame(ggplot2::midwest)

head(midwest, 20)
str(midwest)
summary(midwest)

?midwest
table(midwest$inmetro)

library(dplyr)
midwest <- rename(midwest, total=poptotal, asian=popasian)

head(midwest, 10)

midwest$asian_of_total <- (midwest$asian/midwest$total)*100

mean(midwest$asian_of_total)

midwest$test <- ifelse(midwest$asian_of_total > mean(midwest$asian_of_total), "large", "small")

table(midwest$test)
qplot(midwest$test)

df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                 score = c(5, 4, 3, 4, NA))
df

is.na(df) #is it NA?

table(is.na(df))

table(is.na(df$sex))
table(is.na(df$score))

#If df has at least one missing value, it is not normally calculated.
mean(df$score)
mean(df$sex)

library(dplyr)
df %>% filter(is.na(score))
df %>% filter(!is.na(score))

df_nomiss <- df %>% filter(!is.na(score))
mean(df_nomiss$score)
sum(df_nomiss$score)

df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss

df_nomiss1 <- df %>% na.omit(df)
df_nomiss1

mean(df$score, na.rm = T)

exam <- read.csv("csv_exam.csv")
exam[c(3, 8, 15), "math"] <- NA
exam %>% summarise(mean_math = mean(math, na.rm = T),
                   median_math = median(math, na.rm = T))
exam1 <- data.frame(a = c(1, 2, 4, 3), b = c(1, 3, 4, 6))
exam1
median(exam1$a)

exam$math <- ifelse(is.na(exam$math), 55, exam$math)
table(is.na(exam$math))
exam
mean(exam$math)

#p.170 practice problem

mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65, 124, 131, 153, 212), "hwy"] <- NA
table(is.na(mpg$drv) | is.na(mpg$hwy))
table(is.na(mpg$hwy))
mpg %>% 
    filter(!is.na(hwy)) %>% 
    group_by(drv) %>% 
    summarise(mean_hwy = mean(hwy)) %>% 
    arrange(desc(mean_hwy))

mpg %>% 
    group_by(drv) %>% 
    summarise(mean_hwy = mean(hwy, na.rm = T)) %>% 
    arrange(desc(mean_hwy))
table(mpg$drv)

install.packages("foreign")
library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav",
                         to.data.frame = T)
welfare <- raw_welfare

welfare <- rename(welfare,
                  sex = h10_g3,
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job = h10_eco9,
                  code_region = h10_reg7)

class(welfare$sex)
table(welfare$sex)
welfare$sex <- ifelse(welfare$sex == 1, "male", "female")
table(welfare$sex)
qplot(welfare$sex)

summary(welfare$income)
qplot(welfare$income) + xlim(0, 1000)
table(is.na(welfare$income))

welfare$income <- ifelse(welfare$income %in% c(0, 9999), NA, welfare$income)

#relationship btw sex and income
sex_income <- welfare %>% 
    group_by(sex) %>% 
    summarise(mean_income = mean(income, na.rm = T))
sex_income

ggplot(data = sex_income, aes(x = sex, y = mean_income)) + 
    geom_col()

#relationship btw age and income
class(welfare$birth)
summary(welfare$birth)
qplot(welfare$birth)

table(is.na(welfare$birth))
welfare$age <- 2015 - welfare$birth + 1
summary(welfare$age)

welfare_new <- welfare %>% 
    filter(!is.na(income)) %>% 
    group_by(age) %>% 
    summarise(mean_income = mean(income))

ggplot(data = welfare_new, aes(x = age, y = mean_income)) +
    geom_line()

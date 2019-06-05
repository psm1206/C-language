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
welfare$sex <- ifelse(welfare$sex == 1, "male", "female")
welfare$age <- 2015 - welfare$birth + 1

#relationship btw job and sex
job_male <- welfare %>% 
    filter(!is.na(job) & sex == "male") %>% 
    group_by(job) %>% 
    summarise(number_of_male = n()) %>% 
    arrange(desc(number_of_male)) %>% 
    head(10)

job_female <- welfare %>% 
    filter(!is.na(job) & sex == "female") %>% 
    group_by(job) %>% 
    summarise(number_of_female = n()) %>% 
    arrange(desc(number_of_female)) %>% 
    head(10)

ggplot(data = job_male, aes(x = reorder(job, number_of_male), y = number_of_male)) +
    geom_col() +
    coord_flip()

ggplot(data = job_female, aes(x = reorder(job, number_of_female), y = number_of_female)) +
    geom_col() +
    coord_flip()

#relationship btw religion and divorce

class(welfare$religion)
table(welfare$religion)
welfare$religion <- ifelse(welfare$religion == 1, "yes", "no")
qplot(welfare$religion)

class(welfare$marriage)
table(welfare$marriage)

welfare$group_marriage <- ifelse(welfare$marriage == 1, "marriage",
                                 ifelse(welfare$marriage == 3, "divorce", NA))
table(welfare$group_marriage)
table(is.na(welfare$group_marriage))
qplot(welfare$group_marriage)

religion_marriage <- welfare %>% 
    filter(!is.na(group_marriage)) %>%
    group_by(religion, group_marriage) %>% 
    summarise(n = n()) %>% 
    mutate(pct = round(n/sum(n)*100, 1))

religion_marriage <- welfare %>% 
    filter(!is.na(group_marriage)) %>% 
    count(religion, group_marriage) %>% 
    group_by(religion) %>% 
    mutate(pct = round(n/sum(n)*100, 1))

religion_marriage

divorce <- religion_marriage %>% 
    filter(group_marriage == "divorce") %>% 
    select(religion, pct)
ggplot(data = divorce, aes(x = religion, y = pct)) +
    geom_col()

#relationship btw religion and divorce as ageg

welfare <- welfare %>% 
    mutate(ageg = ifelse(age <30, "young", ifelse(age <= 59, "middle", "old")))
ageg_religion_marriage <- welfare %>% 
    filter(!is.na(group_marriage) & ageg != "young") %>% 
    group_by(ageg, religion, group_marriage) %>% 
    summarise(n = n()) %>% 
    mutate(pct = round(n/sum(n)*100, 1))

ageg_religion_marriage

df_divorce <- ageg_religion_marriage %>% 
    filter(group_marriage == "divorce") %>% 
    select(ageg, religion, pct)
df_divorce

ggplot(data = df_divorce, aes(x = ageg, y = pct, fill = religion)) +
    geom_col(position = "dodge")

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
welfare <- welfare %>% 
    mutate(ageg = ifelse(age <30, "young", ifelse(age <= 59, "middle", "old")))

#ratio of ageg to region
class(welfare$code_region)
table(welfare$code_region)
list_region <- data.frame(code_region = c(1:7),
                          region = c("서울",
                                     "수도권(인천/경기)",
                                     "부산/경남/울산",
                                     "대구/경북",
                                     "대전/충남",
                                     "강원/충북",
                                     "광주/전남/전북/제주도"))
list_region

welfare <- left_join(welfare, list_region, id = "code_region")
welfare %>% 
    select(code_region, region) %>% 
    head

ageg_region <- welfare %>% 
    group_by(region, ageg) %>% 
    summarise(n = n()) %>% 
    mutate(pct = round(n/sum(n)*100, 2)) %>% 
    as.data.frame()

ageg_region

ggplot(data = ageg_region, aes(x = region, y = pct, fill = ageg)) +
    geom_col() +
    coord_flip()
list_order_old <- ageg_region %>% 
    filter(ageg == "old") %>% 
    arrange(pct)

list_order_old
order <- list_order_old$region
order
ggplot(data = ageg_region, aes(x = region, y = pct, fill = ageg)) +
    geom_col() +
    coord_flip() +
    scale_x_discrete(limits = order)

ageg_region$ageg <- factor(ageg_region$ageg,
                           level = c("old", "middle", "young"))
levels(ageg_region$ageg)

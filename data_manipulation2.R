library(dplyr)

exam %>% select(id, math) %>% head
exam %>% select(-math, english) %>% tail

exam %>%
    filter(class==1) %>% 
    select(id, math)

#p.138 practice problem

mpg <- as.data.frame(ggplot2::mpg)
mpg_new <- mpg %>% select(class, cty)
mpg_new

cty1 <- mean((mpg_new %>% filter(class == "suv"))$cty)
cty2 <- mean((mpg_new %>% filter(class == "compact"))$cty)

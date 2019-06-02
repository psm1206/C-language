library(dplyr)

exam <- read.csv("csv_exam.csv")
exam

#filter() 주어진 변수값, 조건에 해당되는 행만 추출

exam %>% filter(class == 3) %>% head(2) #3반 중에 위에서 두 학생

exam %>% filter(class != 1) #1반을 제외한 나머지 반 학생들

exam %>% filter(math >= 70 & science >= 70) #math와 science 모두 70점 이상인 학생들

#(변수) %in% c() 왼쪽에 있는 변수의 값이 지정한 조건 목록에 해당하는지 확인

exam %>% filter(class %in% c(1, 3, 5))

class1 <- exam %>% filter(class == 1)
class3 <- exam %>% filter(class == 3)

class1_math <- mean(class1$math)
class3_science <- mean(class3$science)

#p.133 practice problem

mpg <- as.data.frame(ggplot2::mpg)
group1 <- mpg %>% filter(displ <= 4)
group2 <- mpg %>% filter(displ >= 5)

ifelse(mean(group1$hwy) > mean(group2$hwy), a <- 1, a <- 0)

group3 <- mpg %>% filter(manufacturer == "audi")
group4 <- mpg %>% filter(manufacturer == "toyota")

mean(group3$cty)
mean(group4$cty)

mean((mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda")))$hwy)

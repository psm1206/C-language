test1 <- data.frame(id = c(1, 2, 3, 4, 5),
                    midterm = c(60, 80, 70, 90, 85))
test2 <- data.frame(id = c(1, 2, 3, 4, 5),
                    final = c(70, 83, 65, 95, 80))
test1
test2

library(dplyr)

# left_join : 새로운 변수(열)의 왼쪽면을 기존에 있는 data.frame에 붙인다
total <- left_join(test1, test2, by = "id")
total

name <- data.frame(class = c(1, 2, 3, 4, 5),
                   teacher = c("kim", "lee", "park", "choi", "jung"))

exam_new <- left_join(exam, name, by = "class")
exam_new

# bind_rows : 변수명이 같은 두 data.frame을 결합한다.
# 만약 변수명이 다르다면, rename을 사용해 변수를 일치시켜주면 된다.

#p.156 practice problem
fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringAsFactors = F)
fuel

mpg <- as.data.frame(ggplot2::mpg)
mpg_new <- left_join(mpg, fuel, by = "fl")
mpg_new %>% 
    select(model, fl, price_fl) %>% 
    head(5)

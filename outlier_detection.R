outlier <- data.frame(sex = c(1, 2, 1, 3, 2, 1),
                      score = c(5, 4, 3, 4, 2, 6))
outlier
table(outlier$sex)
table(outlier$score)

outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
outlier %>% 
    filter(!is.na(sex) & !is.na(score)) %>% 
    group_by(sex) %>% 
    summarise(mean_score = mean(score))

mpg <- as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy)$stats

mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy >37, NA, mpg$hwy)
table(is.na(mpg$hwy))
mpg %>% 
    group_by(drv) %>% 
    summarise(mean_hwy = mean(hwy, na.rm = T))

# %>% 은 manipulation이 목표
# $로 직접 변수를 변경시켜주는 이유는 데이터프레임 자체의 값을 변경시키고 싶을 때

#p.178 practice problem

mpg[c(10, 14, 58, 93), "drv"] <- "k"
mpg[c(29, 43, 129, 203), "cty"] <- c(3, 4, 39, 42)
table(mpg$drv)
mpg$drv <- ifelse(mpg$drv %in% c(4, "f", "r"), mpg$drv, NA)
table(mpg$drv)

boxplot(mpg$cty)$stats
mpg$cty <- ifelse(mpg$cty < 9 | mpg$cty > 26, NA, mpg$cty)

mpg %>% 
    filter(!is.na(cty) & !is.na(drv)) %>% 
    group_by(drv) %>% 
    summarise(mean_cty = mean(cty))

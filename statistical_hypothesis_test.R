mpg <- as.data.frame(ggplot2::mpg)
library(dplyr)
mpg_diff <- mpg %>% 
    select(class, cty) %>% 
    filter(class %in% c("compact", "suv"))
head(mpg_diff)
table(mpg_diff$class)

t.test(data = mpg_diff, cty ~ class, var.equal = T)
#t.test는 두 집단의 평균이 통계적으로 유의한 차이가 있는지 보는 test
#일반적으로 유의확률 5%를 판단 기준으로 삼고, p-value가 0.05미만이면 '집단 간 차이가 통계적으로 유의하다.'
#다시 말해서 95% 이상의 확률로 이런 관찰결과가 나온다는 말이다. (100번 실험하면 최소 95번은 같은 결과)

mpg_diff2 <- mpg %>% 
    select(fl, cty) %>% 
    filter(fl %in% c("r", "p"))
table(mpg_diff2$fl)

t.test(data = mpg_diff2, cty ~ fl, var.equal = T) #p-value = 0.2875 -> not statistically significant

#Correlation Analysis
economics <- as.data.frame(ggplot2::economics)
cor.test(economics$pce, economics$unemploy)

head(mtcars)
car_cor <- cor(mtcars)
round(car_cor, 2)

install.packages("corrplot")
library(corrplot)
corrplot(car_cor, method = "number")

col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
corrplot(car_cor,
         method = "color",
         col = col(200),
         type = "lower",
         order = "hclust",
         addCoef.col = "black",
         tl.col = "black",
         tl.srt = 45,
         diag = F)

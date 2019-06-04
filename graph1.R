library(ggplot2)
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
    geom_point() + 
    xlim(3, 6) + 
    ylim(10, 30)
# 1.데이터, 축   2. 그래프 종류   3. 세부 설정

#p.188 exercise problem
ggplot(data = mpg, aes(x = cty, y = hwy)) +
    geom_point()

ggplot(data = midwest, aes(x = poptotal, y = popasian)) +
    geom_point() +
    xlim(0, 500000) +
    ylim(0, 10000)

mpg_new <- mpg %>% 
    group_by(drv) %>% 
    summarise(mean_hwy = mean(hwy))

ggplot(data = mpg_new, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) +
    geom_col()

ggplot(data = mpg, aes(x = drv)) + geom_bar()
ggplot(data = mpg, aes(x = hwy)) + geom_bar()

#p.193 exercise problem
mpg <- as.data.frame(ggplot2::mpg)
mpg_new1 <- mpg %>% 
    filter(class == "suv") %>% 
    group_by(manufacturer) %>% 
    summarise(mean_cty = mean(cty)) %>% 
    arrange(desc(mean_cty)) %>% 
    head(5)

mpg_new1

ggplot(data = mpg_new1, aes(x = reorder(manufacturer, -mean_cty), y = mean_cty)) + 
    geom_col()

ggplot(data = mpg, aes(x = class)) + 
    geom_bar()

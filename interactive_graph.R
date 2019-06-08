install.packages("plotly")
library(plotly)
library(ggplot2)

p <- ggplot(data = mpg, aes(x = displ, y = hwy, col = drv)) +
    geom_point() #drv별로 color를 구분
p
ggplotly(p)

p1 <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) +
    geom_bar(position = "dodge")

ggplotly(p1)

install.packages("dygraphs")
library(dygraphs)

economics <- ggplot2::economics
head(economics)
class(economics)

library(xts) #xts 데이터 타입 - 데이터가 시간 속성을 지님
eco <- xts(economics$unemploy, order.by = economics$date) #convert to xts type
head(eco)
dygraph(eco) %>% 
    dyRangeSelector() #interactive time series plotting
eco_a <- xts(economics$psavert, order.by = economics$date)
eco_b <- xts(economics$unemploy/1000, order.by = economics$date)

eco2 <- cbind(eco_a, eco_b)
colnames(eco2) <- c("psavert", "unemploy")
head(eco2)
dygraph(eco2) %>% 
    dyRangeSelector()

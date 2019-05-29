english <- c(90, 80, 60, 70)
english

math <- c(50, 60, 100, 20)
math

df_midterm <- data.frame(english, math)
df_midterm

class <- c(1, 1, 2, 2)
class

df_midterm <- data.frame(english, math, class)
df_midterm

mean(df_midterm$english)
mean(df_midterm$math)

df_midterm <- data.frame(english = c(9, 8, 6, 7),
                         math = c(5, 6, 10, 2),
                         class = c(1, 1, 2, 2)
                         )
df_midterm

fruit_data <- data.frame( 제품 = c("사과", "딸기", "수박"),
                         가격 = c(1800, 1500, 3000),
                         판매량 = c(24, 38, 13)
)
fruit_data

mean_price <- mean(fruit_data$가격)
mean_quantity <- mean(fruit_data$판매량)

mean_price
mean_quantity

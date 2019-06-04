ggplot(data = economics, aes(x = date, y = unemploy)) + 
    geom_line()

#p.195 exercise problem
ggplot(data = economics, aes(x = date, y = psavert)) +
    geom_line()

ggplot(data = mpg, aes(x = drv, y = hwy)) + 
    geom_boxplot()

#p.198 exercise problem
mpg_new <- mpg %>% 
    filter(class %in% c("compact", "subcompact", "suv"))

ggplot(data = mpg_new, aes(x = class, y = cty)) + 
    geom_boxplot()

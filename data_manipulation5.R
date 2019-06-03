exam <- read.csv("csv_exam.csv")

exam %>% summarise(mean_math = mean(math))

exam %>% 
    group_by(class) %>% 
    summarise(mean_math = mean(math))
exam %>% 
    group_by(class) %>% 
    summarise(mean_math = mean(math),
              mean_english = mean(english),
              mean_science = mean(science),
              number_of_student = n()
              )

mpg <- as.data.frame(ggplot2::mpg)
mpg %>% 
    group_by(manufacturer, drv) %>% 
    summarise(mean_cty = mean(cty)) %>% 
    head(10)

mpg %>% 
    group_by(manufacturer) %>% 
    filter(class == "suv") %>% 
    mutate(total = (cty + hwy)/2) %>% 
    summarise(mean_total = mean(total)) %>% 
    arrange(desc(mean_total)) %>% 
    head(5)

#p.150 practice problem

mpg %>% 
    group_by(class) %>% 
    summarise(mean_cty = mean(cty)) %>% 
    arrange(desc(mean_cty))

mpg %>% 
    group_by(manufacturer) %>% 
    summarise(mean_hwy = mean(hwy)) %>% 
    arrange(desc(mean_hwy)) %>%
    head(3)
    
mpg %>% 
    group_by(manufacturer) %>% 
    filter(class == "compact") %>% 
    summarise(number_of_car = n()) %>% 
    arrange(desc(number_of_car))

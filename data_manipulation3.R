exam %>% arrange(math) %>% head
exam %>% arrange(desc(math)) %>% head

exam %>% arrange(class, desc(science)) #class별로 오름차순 후, science별로 내림차순 진행

exam %>% 
    arrange(math, science) %>%
    head(10) #math별로 오름차순후, math가 같을 시에 science별로 오름차순 진행
#앞에 적은 변수가 기준이 된다. 앞에 적은 변수에 따른 정렬은 변하지 않음.

#p.141 practice problem

mpg <- as.data.frame(ggplot2::mpg)
mpg %>%
    filter(manufacturer == "audi") %>% 
    select(manufacturer, hwy, model) %>% 
    arrange(desc(hwy)) %>% 
    head(5)

exam %>% 
    mutate(total = math + english + science,
           mean = (math + english + science)/3) %>% 
    arrange(desc(total)) %>% 
    head()

exam %>% 
    mutate(test = ifelse(science >= 60, "pass", "fail")) %>% 
    head()

#p.144 practice problem
mpg <- as.data.frame(ggplot2::mpg)
mpg_new1 <- mpg %>% mutate(sum = hwy + cty)
mpg_new2 <- mpg %>% mutate(mean = (hwy + cty)/2)

mpg_new2 %>% 
    arrange(desc(mean)) %>%
    head(3)

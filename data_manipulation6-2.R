midwest <- as.data.frame(ggplot2::midwest)

midwest_new1 <- midwest %>% 
    mutate(child_of_tot = ((poptotal - popadults)/poptotal)*100) %>% 
    select(county, child_of_tot) %>% 
    arrange(desc(child_of_tot)) 

midwest_new2 <- midwest %>% 
    mutate(child_of_tot = ((poptotal - popadults)/poptotal)*100, 
           class = ifelse(child_of_tot >=40, "large", ifelse(child_of_tot >= 30, "middle", "small")))
table(midwest_new2$class)
    
midwest_new1$class <- ifelse(midwest_new1$child_of_tot >= 40, "large",
                        ifelse(midwest_new1$child_of_tot >= 30, "middle", "small"))
midwest_new1 %>%
    group_by(class) %>% 
    summarise(number_of_county = n())

midwest %>% 
    mutate(asi_of_tot = (popasian/poptotal)*100) %>% 
    select(state, county, asi_of_tot) %>% 
    arrange(asi_of_tot) %>% 
    head(10)

library(KoNLP)
library(dplyr)
library(stringr)
library(wordcloud)
library(RColorBrewer)

twitter <- read.csv("twitter.csv",
                    header = T,
                    stringsAsFactors = F,
                    fileEncoding = "UTF-8")
twitter <- rename(twitter,
                  no = 번호,
                  id = 계정이름,
                  date = 작성일,
                  tw = 내용)
twitter$tw <- str_replace_all(twitter$tw, "\\W", " ")
head(twitter$tw)

nouns <- extractNoun(twitter$tw)
wordcount <- table(unlist(nouns))
df_word <- as.data.frame(wordcount, stringsAsFactors = F)
df_word <- rename(df_word,
                  word = Var1,
                  freq = Freq)
df_word <- df_word %>% 
    filter(nchar(word) >= 2)
top20 <- df_word %>% 
    arrange(desc(freq)) %>% 
    head(20)
top20

library(ggplot2)
order <- arrange(top20, freq)$word #freq를 기준으로 오름차순 정렬하고 변수들 중에 word만을 뽑아냄 
order

ggplot(data = top20, aes(x = word, y = freq)) +
    geom_col() +
    coord_flip() +
    scale_x_discrete(limits = order) +
    ylim(0, 2500) +
    geom_text(aes(label = freq), hjust = -.3)

pal <- brewer.pal(8, "Dark2")
set.seed(1234)

wordcloud(words = df_word$word,
          freq = df_word$freq,
          min.freq = 10,
          max.words = 200,
          random.order = F,
          rot.per = 0.1,
          scale = c(6, 0.2),
          colors = pal)

pal1 <- brewer.pal(9, "Blues")[5:9]
wordcloud(words = df_word$word,
          freq = df_word$freq,
          min.freq = 10,
          max.words = 200,
          random.order = F,
          rot.per = 0.1,
          scale = c(8, 0.4),
          colors = pal1)

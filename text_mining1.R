install.packages("rJava")
install.packages("memoise")
install.packages("KoNLP") #Korean Natural Language Processing - 한글 데이터로 형태소 분석

library(KoNLP)
library(dplyr)

useNIADic()
txt <- readLines("hiphop.txt")
head(txt)

install.packages("stringr") #문자 처리 패키지 ex)문장에 포함되어있는 이모티콘이나 특수문자를 제거해줌
library(stringr)
txt <- str_replace_all(txt, "\\W", " ") #\\W : 특수문자를 의미하는 정규 표현식(Regular Expression)

extractNoun("대한민국의 영토는 한반도와 그 부속도서로 한다")

nouns <- extractNoun(txt) #문장에서 명사를 추출해서 nouns에 저장
wordcount <- table(unlist(nouns)) #list로 되어있는 nouns를 빈도 테이블로 변환해서 wordcount에 저장
df_word <- as.data.frame(wordcount, stringsAsFactors = F) #데이터 프레임으로 변환
df_word <- rename(df_word,
                  word = Var1,
                  freq = Freq)

df_word <- filter(df_word, nchar(word) >= 2) #두 글자 이상으로 된 단어만 필터링
top_20 <- df_word %>% 
    arrange(desc(freq)) %>% 
    head(20)
top_20

install.packages("wordcloud")
library(wordcloud)
library(RColorBrewer)
pal <- brewer.pal(8, "Dark2")
set.seed(1234) #항상 동일한 wordcloud가 생성되도록 난수를 고정

wordcloud(words = df_word$word,
          freq = df_word$freq,
          min.freq = 2,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(4, 0.3),
          colors = pal)

pal <- brewer.pal(9, "Blues")[5:9]
wordcloud(words = df_word$word,
          freq = df_word$freq,
          min.freq = 2,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(4, 0.3),
          colors = pal)

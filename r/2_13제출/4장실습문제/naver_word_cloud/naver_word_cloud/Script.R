setwd("c:\\easy_r")
install.packages("KoNLP")
install.packages("wordcloud")
library(KoNLP)
library(wordcloud)
useSejongDic()
#mergeUserDic(data.frame("서진수", "ncn"))
txt <- readLines("naver_blog_news.txt")
#txt
nouns <- sapply(txt, extractNoun, USE.NAMES = F)
#nouns
head(unlist(nouns), 30)
nouns <- Filter(function(x) { nchar(x) >= 2 }, unlist(nouns))
write(unlist(nouns), "naver_blog_news_2.txt")
rev <- read.table("naver_blog_news_2.txt")
nrow(rev)


wordcount <- table(rev)
#wordcount
head(sort(wordcount, decreasing = T), 30)

library(RColorBrewer)
palete <- brewer.pal(9, "Set1")
wordcloud(names(wordcount), freq = wordcount, scale = c(5, 0.5), rot.per = 0.25, min.freq = 1, random.order = F, random.color = T, colors = palete)
legend(0.3, 1, "여성 안심 귀가 서비스 네이버 크롤링", cex = 0.8, fill = NA, bg = "white", text.col = "red", text.font = 2, box.col = "red")

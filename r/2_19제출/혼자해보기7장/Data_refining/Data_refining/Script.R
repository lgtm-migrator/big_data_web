df <- data.frame(sex = c("M", "F", NA, "M", "F"), score = c(5, 4, 3, 4, NA))
df
is.na(df)
table(is.na(df))
table(is.na(df$sex))
table(is.na(df$score))
mean(df$score)
sum(df$score)
library(dplyr)
df %>% filter(is.na(score))
df %>% filter(!is.na(score))
df_nomiss <- df %>% filter(!is.na(score))
mean(df_nomiss$score)
sum(df_nomiss$score)
#score, sex 결측치 제외
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss
df_nomiss2 <- na.omit(df)
df_nomiss2
mean(df$score, na.rm = T)
sum(df$score, na.rm = T)
setwd("c://easy_r")
exam <- read.csv("csv_exam.csv")
exam[c(3, 8, 15), "math"] <- NA
exam %>% summarise(mean_math = mean(math))
exam %>% summarise(mean_math = mean(math, na.rm = T))

exam %>% summarise(mean_math = mean(math, na.rm = T),
                   sum_math = sum(math, na.rm = T),
                   median_mat = median(math, na.rm = T))
mean(exam$math, na.rm = T)
exam$math <- ifelse(is.na(exam$math), 55, exam$math)
table(is.na(exam$math))
exam
mean(exam$math)
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65, 124, 131, 153, 212), "hwy"] <- NA
#Q1
table(is.na(mpg))
#Q2


outlier <- data.frame(sex = c(1, 2, 1, 3, 2, 1), score = c(5, 4, 3, 4, 2, 6))
outlier
table(outlier$sex)
table(outlier$score)

outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
outlier
outlier %>%
    filter(!is.na(sex) & !is.na(score)) %>%
    group_by(sex) %>%
    summarise(mean_score = mean(score))
msgWindow <- as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy)
boxplot(mpg$hwy)$stats
mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)
table(is.na(mpg$hwy))
mpg %>%
    group_by(drv) %>%
    summarise(mean_hwy = mean(hwy, na.rm = T))

#혼자서 해보기
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10, 14, 58, 93), "drv"] <- "k"
mpg[c(29, 43, 129, 203), "cty"] <- c(3, 4, 39, 42)
#Q1
#Q2
#Q3
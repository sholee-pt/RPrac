mutate(df, name_variable_1 = condition, ...)
#df: 새 변수의 생성에 사용될 data frame
#name_variable_1: 새 변수의 생성을 위한 이름과 공식
#...: 무제한 제약, mutate() 함수 내에서 하나 이상의 변수를 생성할 가능성

PATH <- "https://raw.githubusercontent.com/guru99-edu/R-Programming/master/test.csv"
df_titanic <- read.csv(PATH, sep = ",")
list_na <- colnames(df_titanic)[apply(df_titanic, 2, anyNA)] #df_titanic의 각 열에 대해 NA값의 여부를 판별하여 boolean으로 반환

library(dplyr)
df_titanic_drop <- df_titanic %>% na.omit() #na.omit(df_titanic)과 같음, na.omit(): data frame에서 NA값을 포함하는 행을 제거하여 반환하는 함수
dim(df_titanic_drop)

average_missing <- apply(df_titanic[,colnames(df_titanic) %in% list_na], 2, mean, na.rm = TRUE) #na.rm = TRUE: NA는 무시
df_titanic_replace <- df_titanic %>% mutate(replace_mean_age = ifelse(is.na(Age), average_missing[1], Age), replace_mean_fare = ifelse(is.na(Fare), average_missing[2], Fare)) #ifelse(): 조건문이 yes or no에 따라 반환
sum(is.na(df_titanic_replace$Age))
sum(is.na(df_titanic_replace$replace_mean_age))

median_missing <- apply(df_titanic[,colnames(df_titanic) %in% list_na], 2, median, na.rm = TRUE)
df_titanic_replace <- df_titanic %>% mutate(replace_median_age = ifelse(is.na(Age), median_missing[1], Age), replace_median_fare = ifelse(is.na(Fare), median_missing[2], Fare))
tail(df_titanic_replace)

df_titanic_impute_mean <- data.frame(sapply(df_titanic, function(x) ifelse(is.na(x), mean(x, na.rm = TRUE), x)))
tail(df_titanic_impute_mean)
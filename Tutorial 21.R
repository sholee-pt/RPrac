library(dplyr)
PATH <- "https://raw.githubusercontent.com/guru99-edu/R-Programming/master/travel_times.csv"
df <- read.csv(PATH)
glimpse(df)
sum(df$Comments == "") #Comments column의 값이 NA, 즉, ""인 관측치의 합

step_1_df <- select(df, -Comments) #Comments 변수 제외
dim(df); dim(step_1_df)

filter(df, condition)
#df: data filter에 사용될 data set
#condition: 데이터 필요조건

table(step_1_df$GoingTo) #table(): vector에 포함된 고유한 값들의 빈도를 계산
select_home <- filter(df, GoingTo == "Home") #단일 선택택
dim(select_home)
select_work <- filter(df, GoingTo == "GSK")
dim(select_work)

select_home_wed <- filter(df, GoingTo == "Home" & DayOfWeek == "Wednesday") #복수 선택
dim(select_home_wed)

#pipeline 연산자 x
step_1 <- read.csv(PATH)
step_2 <- select(step_1, GoingTo, DayOfWeek)
step_3 <- filter(step_2, GoingTo == "Home", DayOfWeek == "Wednesday")
head(step_3)

#pipeline 연산자 o
filter_home_wed <- read.csv(PATH) %>% select(GoingTo, DayOfWeek) %>% filter(GoingTo == "Home", DayOfWeek == "Wednesday")
identical(step_3, filter_home_wed)

arrange(A) #변수 A의 오름차순 정렬
arrange(A, B) #변수 A와 B의 오름차순 정렬
arrange(desc(A), B) #변수 A는 내림차순으로, 변수 B는 오름차순으로 정렬

step_2_df <- step_1_df %>% arrange(GoingTo, Distance)
head(step_2_df)
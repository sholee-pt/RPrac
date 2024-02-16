library(dplyr) #data 변환을 돕는 library
df_primary <- tribble(~ID, ~y, "A", 5, "B", 5, "C", 8, "D", 0, "F", 9)
df_secondary <- tribble(~ID, ~z, "A", 30, "B", 21, "C", 22, "D", 25, "E", 29)

#NA: Not Available의 약자로, missing value를 의미함
left_join(df_primary, df_secondary, by = 'ID') #left table을 기준으로 merge
right_join(df_primary, df_secondary, by = 'ID') #right table을 기준으로 merge
inner_join(df_primary, df_secondary, by = 'ID') #수학적으로는 교집합과 유사함
full_join(df_primary, df_secondary, by = 'ID') #수학적으로는 합집합과 유사함

df_primary1 <- tribble(~ID, ~year, ~items, "A", 2015,3,  "A", 2016,7, "A", 2017,6, "B", 2015,4, "B", 2016,8, "B", 2017,7, "C", 2015,4, "C", 2016,6, "C", 2017,6)
df_secondary1 <- tribble(~ID, ~year, ~prices, "A", 2015,9, "A", 2016,8, "A", 2017,12, "B", 2015,13, "B", 2016,14, "B", 2017,6, "C", 2015,15, "C", 2016,15, "C", 2017,13)
left_join(df_primary1, df_secondary1, by = c('ID', 'year'))

gather(data, key, value, na.rm = FALSE) #wide format의 data를 long format으로 변환
spread(data, key, value) #long format의 data를 wide format으로 변환

separate(data, col, into, sep = "", remove = TRUE) #1개의 변수를 2개로 나눔
#data: data set의 모양을 변환하는데 사용되는 data frame
#col: 분리할 열
#into: 새로운 변수들의 이름
#sep: 변수를 분리하는데 사용되는 기호, ex) - _ %
#remove: 이전의 열 제거 여부, default는 TRUE

unite(data, col, conc, sep = "", remove = TRUE) #2개의 변수를 1개로 묶음
#data: data set의 모양을 변환하는데 사용되는 data frame
#col: 새로운 열의 이름
#conc: 결합되는 열의 이름
#sep: 변수를 결합하는데 사용되는 기호, ex) - _ %
#remove: 이전 열의 제거 여부, default는 TRUE

library(tidyr)
messy <- data.frame(country = c("A", "B", "C"), q1_2017 = c(0.03, 0.05, 0.01), q2_2017 = c(0.05, 0.07, 0.02), q3_2017 = c(0.04, 0.05, 0.01), q4_2017 = c(0.03, 0.02, 0.04))
tidier <-messy %>% gather(quarter, growth, q1_2017:q4_2017) #%>%: 파이프 연산자로써 객체를 다른 함수에 전달하는 것
messy_1 <-tidier %>% spread(quarter, growth)
separate_tidier <-tidier%>% separate(quarter, c("Qrt", "year"), sep = "_")
unite_tidier <-separate_tidier %>% unite(Quarter, c("Qrt", "year"), sep = "_")
library(dplyr)
data <- read.csv("https://raw.githubusercontent.com/guru99-edu/R-Programming/master/lahman-batting.csv") %>%
  select(c(playerID, yearID, AB, teamID, lgID, G, R, HR, SH)) %>%
  arrange(playerID, teamID, yearID) #정렬 순서 지정
glimpse(data) #data의 일부를 load하고, 데이터 구조를 빠르게 파악

summarise(df, variable_name = condition)
#df: 요약 통계치 계산에 사용될 data set
#variable_name = condition =  새 변수를 생성할 공식

summarise(data, mean_run = mean(R))
summarise(data, mean_games = mean(G), mean_SH = mean(SH, na.rm = TRUE)) #na.rm = TRUE: SH가 결측치를 포함하고 있기 때문에

data %>% group_by(lgID) %>% summarise(mean_home_run = mean(HR)) %>%
  ggplot(aes(x = lgID, y = mean_home_run, fill = lgID)) + geom_bar(stat = "identity") + theme_classic() +
  labs(x = "baseball league", y = "Average home run", title = paste("Example group_by() with summarise()"))

ex1 <- data %>% group_by(yearID) %>% summarise(mean_game_year = mean(G))
ggplot(ex1, aes(x = yearID, y = mean_game_year)) + geom_line() + theme_classic() +
labs(x = "Year", y = "Average games played", title = paste("Average games played from 1871 to 2016")) #기본 함수

data %>% group_by(lgID) %>%
  summarise(median_at_bat_league = median(AB), median_at_bat_league_no_zero = median(AB[AB >0])) #부분 집합

data %>% group_by(lgID) %>% summarise(sum_homerun_league = sum(HR)) #합

data %>% group_by(teamID) %>% summarise(sd_at_bat_league = sd(HR)) #표준 편차

data %>% group_by(playerID) %>% summarise(min_G = min(G), max_G = max(G)) #min value와 max value

data %>% group_by(playerID) %>% summarise(number_year = n()) %>% arrange(desc(number_year)) #count

data %>% group_by(playerID) %>% summarise(first_appearance = first(yearID), last_appearance = last(yearID)) #data의 정렬이 잘못되어있어 연도가 순서대로 나오지 않는 문제 발생
data %>% group_by(playerID) %>% summarise(first_appearance = min(yearID), last_appearance = max(yearID)) #min()과 max()로 위 문제점을 보완

data %>% group_by(teamID) %>% summarise(second_game = nth(yearID, 2)) %>% arrange(second_game) #nth(x, n): x vector의 n번째 값만 filter

data %>% group_by(teamID) %>% summarise(number_player = n_distinct(playerID)) %>% arrange(desc(number_player)) #중복된 값을 가진 행도 모두 포함하는 n()과 달리 n_distinct()는 중복되지 않은 고유한 값의 개수를 셈
data %>% group_by(teamID, yearID) %>% summarise(number_player = n_distinct(playerID)) %>% arrange(teamID, yearID)

data %>% group_by(teamID, yearID) %>% summarise(number_player = n_distinct(playerID)) %>% arrange(teamID, yearID)
data %>% group_by(yearID, teamID) %>% summarise(mean_games = mean(G)) %>% arrange(desc(teamID, yearID))

data %>% filter(yearID > 1980) %>% group_by(yearID) %>% summarise(mean_game_year = mean(G)) #filter(): data frame에서 원하는 행만 선택하여 추출함

data %>% filter(HR > 0) %>% group_by(playerID) %>% summarise(average_HR_game = sum(HR)/sum(G)) %>%
  ungroup() %>% summarise(total_average_homerun = mean(average_HR_game)) #ungroup(): 그룹화를 해제하여 data를 일반적인 형태로 되돌릴 수 있음
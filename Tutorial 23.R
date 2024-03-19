library(dplyr)
library(ggplot2)
data_air <- airquality %>%
  select(-c(Solar.R, Temp)) %>%
  mutate(Month = factor(Month, order = TRUE, labels = c("May", "June", "July", "August", "September")),
         day_cat = factor(ifelse(Day < 10, "Begin", ifelse(Day < 20, "Middle", "End"))))
data_air_no_na <- data_air %>% na.omit() #data set의 결측치(NA) 제거

box_plot <- ggplot(data_air_no_na, aes(x = Month, y = Ozone))
box_plot + geom_boxplot() #box plot 작성
box_plot + geom_boxplot() + coord_flip() #coord_flip(): 그래프 옆으로 돌리기

box_plot + geom_boxplot(outlier.colour = "red", outlier.shape = 2, outlier.size = 3) + theme_classic()
#outlier.colour = "red": 특이점의 색 제어
#outlier.shape = 2: 특이치의 모양 변경, 2는 삼각형
#outlier.size = 3: 삼각형의 크기 변경, 그 크기는 숫자에 비례

box_plot + geom_boxplot() + stat_summary(fun.y = mean, geom = "point", size = 3, color = "steelblue") + theme_classic()
#stat_summary(): box plot에 요약 정보를 추가할 수 있게 함
#fun.y: 반환된 통계치를 통제(평균, 최솟값, 최댓값 등)
#geom = "point": 점으로 평균 표시
#size = 3: 점의 크기
#color = "steelblue": 점의 색

box_plot + geom_boxplot() + geom_dotplot(binaxis = 'y', dotsize = 0.5, stackdir = 'center') + theme_classic()
#geom_dotplot(): 점 추가 가능
#binaxis = 'y': y축을 따라 점의 위치를 변경, default는 x축
#dotsize = 0.5: 점 크기
#stackdir = 'center' 점 누적 방법(up, down. center, centerwhole)

ggplot(data_air_no_na, aes(x = Month, y = Ozone, color = Month)) + geom_boxplot() + theme_classic() #Month별로 색깔을 나눔
ggplot(data_air_no_na, aes(Month, Ozone)) + geom_boxplot(aes(fill = day_cat)) + theme_classic()

box_plot + geom_boxplot() + geom_jitter(shape = 15, color = "steelblue", position = position_jitter(width = 0.21)) + theme_classic()
#geom_jitter(): 각 점들이 갖는 일종의 부식(decay) 현상을 추가
#shape = 15: 점의 모양 변경, 15는 정사각형을 나타냄
#color = "steelblue": 점 색상 변경
#position = position_jitter(width = 0.21): 겹치는 점을 배치하는 방법, x축에서 점을 20% 이동한다는 것을 의미, default는 40%

box_plot + geom_boxplot() + geom_point(shape = 5, color = "steelblue") + theme_classic()
box_plot + geom_boxplot(notch = TRUE) + theme_classic()
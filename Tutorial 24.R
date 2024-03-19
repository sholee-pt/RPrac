library(ggplot2)
ggplot(data, mapping = aes()) + geometric_object
#data: 그래프 작성에 사용되는 data set
#mapping: x축과 y축 제어
#geometric object: 작성할 그래프 종류

ggplot(mtcars, aes(x = factor(cyl))) + geom_bar()
ggplot(mtcars, aes(x = factor(cyl))) + geom_bar(fill = "coral") + theme_classic() #fill 인수에 따라 색을 변경할 수 있음
grDevices::colors() #R에서 이용 가능한 모든 색상을 볼 수 있음, 약 650개

ggplot(mtcars, aes(factor(cyl))) + geom_bar(fill = "coral", alpha = 0.5) + theme_classic() #alpha인수로 투명도 설정 가능
ggplot(mtcars, aes(factor(cyl), fill = factor(cyl))) + geom_bar() #그룹별 색상 부여

library(dplyr)
data <- mtcars %>% mutate(am = factor(am, labels = c("auto", "man")), cyl = factor(cyl))
ggplot(data, aes(x = cyl, fill = am)) + geom_bar() + theme_classic() #막대에 그룹 추가
ggplot(data, aes(x = cyl, fill = am)) + geom_bar(position = "fill") + theme_classic() #position = "fill"로 y축을 0~1까지 꽉채움
ggplot(data, aes(x = cyl, fill = am)) + geom_bar(position = position_dodge()) + theme_classic() #position_dodge()로 그룹을 나눠서 그림

data_histogram <- mtcars %>% mutate(cyl = factor(cyl)) %>% group_by(cyl) %>% summarize(mean_mpg = round(mean(mpg), 2))
bar_graph <- ggplot(data_histogram, aes(x = cyl, y = mean_mpg, fill = cyl)) + geom_bar(stat = "identity", width = 0.5) + coord_flip() + theme_classic()
bar_graph + geom_text(aes(label = mean_mpg), hjust = 1.5, color = "white", size = 3)
#geom_text(): 텍스트의 미관을 제어하는데 유용함
#hjust: 라벨의 위치를 제어, 1에 가까우면 상단에 라벨을 배치함
#color = "white": 텍스트 색상을 변경
#size = 3: 텍스트 크기를 설정
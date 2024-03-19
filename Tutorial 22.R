library(ggplot2)
ggplot(data, mapping = aes() + geometric_object)
#data: graphic 작성을 위해 사용되는 data set
#mapping: x axis와 y axis 제어
#geometric_object: 보여주고 싶은 graphic 유형
#점(Point): geom_point(), 막대(Bar): geom_bar(), 선(Line): geom_line(), 히스토그램(Histogram): geom_histogram()

ggplot(mtcars, aes(x = drat, y = mpg)) + geom_point() #'+': R의 코드가 계속 이어짐을 의미하며, 이전 단계의 결과를 다음 입력으로 전달
ggplot(mtcars, aes(x = mpg, y = drat)) +geom_point(aes(color = factor(gear))) #factor(gear): 각각의 기어 수에 따라 다른 색상의 점이 그려짐
ggplot(mtcars, aes(x = log(mpg), y = log(drat))) + geom_point(aes(color = factor(gear))) #log scale로 각각의 axis 변경

my_graph <- ggplot(mtcars, aes(x = log(mpg), y = log(drat))) + geom_point(aes(color = factor(gear))) +
  stat_smooth(method = "lm", col = "#C42126", se = FALSE, size = 1); my_graph
#method = "lm": 선형 회귀 모형
#col = "#C42126": 선의 색깔을 hexademical 코드로 결정
#se = FALSE: 추세선 주변에 그려지는 신뢰구간의 등장여부
#size = 1: 추세선의 두께 결정

labs(title = "Hello sholeept", subtitle = "My first plot")
#title: 제목을 변경 혹은 추가
#subtitle: 제목 밑에 부제를 추가
#caption: 그래프 밑에 그래프 설명 추가
#x, y: x,y축 제목

my_graph + labs(title = "Plot Mile per hours and drat, in log")

paste("This is a text", A)
#"": 인용부호 안의 text는 정적 text
#A: A에 저장된 변수를 표시

A <- 2010
paste("The first year is", A)
B <- 2018
paste("The first year is", A, "and the last year is", B)

mean_mpg <- mean(mtcars$mpg)
my_graph + labs(title = paste("Plot Mile per hours and drat, in log. Average mpg is", mean_mpg))
my_graph + labs(title = "Relation beteween Mile per hours and drat", subtitle = "Relationship break down by gear class", caption = "Authors own computation")
my_graph + labs(x = "Drat definition", y = "Mile per hours", color = "Gear",
                title = "Relation between mile per hours and drat", subtitle = "Relationship break down by gear class", caption = "Authors own computation")

seq(begin, last, by = x)
#begin: 수열의 첫 수
#last: 수열의 마지막 수
#by = x: 단계, 예를들어 x가 2이면, 코드는 last가 될 때까지 begin에 2를 더해감

seq(0, 12, 4) #seq(0, 12, by = 4)와 같으며 by 매개변수를 생략하고 간격 값을 바로 입력할 수 있음

modified_graph <- my_graph + scale_x_continuous(breaks = seq(1, 3.6, by = 0.2)) + scale_y_continuous(breaks = seq(1, 1.6, by = 0.1)) + #scale_x,y_continuous()로 각 축의 눈금을 수동으로 설정 가능
  labs(x = "Drat definition", y = "Mile per hours", color = "Gear",
       title = "Relation between mile per hours and drat", subtitle = "Relationship break down by gear class", caption = "Authors own computation")
modified_graph + theme_dark() #bw, light, classis, linedraw, dark, minimal, gray, void의 8가지 테마로 plot customizing 가능

ggsave("my_first_plot.png", width = 6, height = 4) #이름, 크기, 해상도를 설정하여 plot을 save함
directory <- getwd() #working directory
open_folder(directory)
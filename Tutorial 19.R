cor(x, y, method)
#x, y: 1, 2번째 vector
#method: 상관관계를 계산하는데 사용되는 공식으로, "pearson", "kendall", "spearman" 중에서 선택

library(dplyr)
PATH <- "https://raw.githubusercontent.com/guru99-edu/R-Programming/master/british_household.csv"
data <- read.csv(PATH)

data1 <- filter(data, income < 500)
data2 <- mutate(data1, log_income = log(income), log_totexp = log(totexp), children_fac = factor(children, order = TRUE, labels = c("No", "Yes")))
data3 <- select(data2, -c(X, children, totexp, income))
glimpse(data3)

cor(data3$log_income, data3$wfood, method = "pearson") #피어슨 상관관계(linear)
cor(data3$log_income, data3$wfood, method = "spearman") #스피어만 순위상관관계

mat_1 <- as.dist(round(cor(data3[,1:9]), 2)) #as.dist(): matrix의 대각선 하단부만 보여줌, round(): value들을 소숫점 이하 2째자리에서 반올림

library(Hmisc)
data_rcorr <- as.matrix(data3[, 1:9]) #p-value: 검정하고 있는 가설의 진위여부를 판단한다는데에 사용되는 척도
mat_2 <- rcorr(data_rcorr)
p_value <- round(mat_2[["P"]], 3); p_value

library(GGally)
ggcorr(df, method = c("pairwise", "pearson"), nbreaks = NULL, digits = 2, low = "#3B9AB2", mid = "#EEEEEE", high = "#F21A00", geom = "tile", label = FALSE, label_alpha = FALSE)
#df: 사용되는 data set
#method: 상관관계 계산 공식으로 default는 pairwise와 pearson
#nbreaks: 계수의 색상을 위한 범주형 범위 return, default는 'no break'이고 색 그래디언트는 연속형
#digits: 상관계수를 반올림, default는 2자리
#low: 색상의 가장 낮은 수준
#mid: 색상의 중간 수준
#high: 색상의 가장 높은 수준
#geom: 기하학적 인수의 모양 제어로 default는 'tile'
#label: boolean 값, label의 표시 여부로 default는 FALSE

ggcorr(data3) #기본적인 heatmap
ggcorr(data3, nbreaks = 6, low = "steelblue", mid = "white", high = "darkred", geom = "circle") #heatmap에 제어기 추가
ggcorr(data3, nbreaks = 6, label = TRUE, label_size = 3, color = "grey50") #heatmap에 data value 표시

ggpair(df, columns = 1: ncol(df), title = NULL, upper = list(continuous = "cor"), lower = list(continuous = "smooth"), mapping = NULL)
#df: 사용되는 data set
#columns: plot을 작성할 column 선택
#title: 제목
#upper: plot의 대각선 위의 box들을 제어, 연산 혹은 그래프의 종류를 제시, continuous = "cor"은 상관관계의 계산을 요청함
#lower: plot의 대각선 하단의 box들을 제어
#mapping: 각 산점도에 대해 추가적인 그래픽 요소 설정 가능

library(GGally)
ggpairs(data3, columns = c("log_totexp", "log_income", "age", "wtrans"), title = "Bivariate analysis of revenue expenditure by the British household", upper = list(continuous = wrap("cor", size = 3)), lower = list(continuous = wrap("smooth", alpha = 0.3, size = 0.1)), mapping = aes(color = children_fac))
ggpairs(data3, columns = c("log_totexp", "log_income", "age", "wtrans"), title = "Bivariate analysis of revenue expenditure by the British household", upper = list(continuous = wrap("cor", size = 3), mapping = aes(color = children_fac)), lower = list(continuous = wrap("smooth", alpha = 0.3, size = 0.1)))
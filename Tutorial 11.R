set.seed(123)
x = rnorm(1000)
ts <- cumsum(x)
diff_ts <- diff(ts)
par(mfrow=c(1,2))
plot(ts, type='l')
plot(diff(ts), type='l')

dt <- cars
length(dt[,1])

abs(x) #x의 절대값
log(x, base = y) #밑을 y로 하는 x의 log, 밑을 지정하지 않으면 lnx를 return
exp(x) #e의 x제곱
sqrt(x) #x의 제곱근
factanal(x) #x팩토리얼

x_vector <- seq(45, 55, by = 1)
log(x_vector)
exp(x_vector)
sqrt(x_vector)
factorial(x_vector)

mean(x) #x의 평균
median(x) #x의 중앙값
var(x) #x의 분산
sd(x) #x의 표준편차
scale(x) #x의 표준점수(z점수)
quantile(x) #x의 사분위수
summary(x) #x의 요약정보: 평균, 최소, 최대, 사분위수 등

speed <- cars$speed #cars라는 data frame에서 speed 열만 선택하여 추출
mean(speed)
median(speed)
var(speed)
sd(speed)
head(scale(speed), 5) #총 data frame에서 앞의 5개의 열만 출력
quantile(speed)
summary(speed)

square_function <- function(n) {
  n^2
}
square_function(4)
rm(square_function) #rm(): 함수 사용 후에 삭제 가능

ls(environment())

times <- function(x, y) {
  x*y
}
times(2, 4)

library(tibble)
data_frame <- tibble(c1 = rnorm(50, 5, 1.5), c2 = rnorm(50, 5, 1.5), c3 = rnorm(50, 5, 1.5))
(data_frame$c1 - min(data_frame$c1))/(max(data_frame$c1) - min(data_frame$c1)) #c1열의 정규화 값
data_frame$c1_norm <- (data_frame$c1 -min(data_frame$c1))/(max(data_frame$c1)-min(data_frame$c1))
data_frame$c2_norm <- (data_frame$c2 -min(data_frame$c2))/(max(data_frame$c2)-min(data_frame$c2))
data_frame$c3_norm <- (data_frame$c3 -min(data_frame$c3))/(max(data_frame$c3)-min(data_frame$c3))
head(data_frame$c3_norm, 5)

normalize <- function(x) {
  nominator <- x - min(x)
  denominator <- max(x) - min(x)
  normalize <- nominator/denominator
  return(normalize)
}
normalize(data_frame$c1)
data_frame$c1_norm_function <- normalize(data_frame$c1)
data_frame$c2_norm_function <- normalize(data_frame$c2)
data_frame$c3_norm_function <- normalize(data_frame$c3)

#data frame을 train data와 test data로 분할하는 function
split_data <- function(df, train = TRUE) {
  length <- nrow(df)
  total_row <- length*0.8
  split <- 1:total_row
  if (train == TRUE) {
    train_df <- df[split, ]
    return(train_df)
  } else {
    test_df <- df[-split, ]
    return(test_df)
  }
}
#df: data set 정의
#train: 함수가 train data 혹은 test data를 반환할지를 지정, default는 TRUE

train <- split_data(airquality, train = TRUE)
dim(train)
test <- split_data(airquality, train = FALSE)
dim(test)
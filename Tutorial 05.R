factor(x = character(), levels, labels = levels, ordered = is.ordered(x))
#factor: 범주형 데이터를 나타내는 data type
#x: data의 vector로, double이 아닌 String 혹은 integer이어야 함
#Level: x가 가질 수 있는 가능한 값의 vector이며 default는 vector x의 각 항목들의 단일값 목록임

gender_vector <- c("Male", "Female", "Female", "Male", "Male")
class(gender_vector)
factor_gender <- factor(gender_vector) #factor변수로 변환
class(factor_gender)

color_vector <- c("blue", "red", "green", "white", "black", "yellow")
factor_color <- factor(color_vector); factor_color #알파벳 순으로 Level이 결정됨

day_vector <- c('evening', 'morning', 'afternoon', 'midday', 'midnight', 'evening')
factor_day <- factor(day_vector, levels = c('morning', 'midday', 'afternoon', 'evening', 'midnight'), ordered = TRUE); factor_day
summary(factor_day) #summary() 함수를 사용하여 factor 값을 셀수 있음

dataset <- mtcars #mtcars는 R에 내장된 dataset임
class(dataset)
class(dataset$mpg) #mpg: mile per gallon 변수의 class를 확인
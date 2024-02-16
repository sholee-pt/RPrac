list(element1, ...)
#element1: 모든 type의 R object
#...: 지정하고 싶은 만큼의 object들, 각각의 object들은 ','로 분리할 필요가 있음

vect <- 1:5 #1~5의 vector 생성
mat <- matrix(1:10, ncol = 5); dim(mat) #2x5 matrix 생성
df1 <- EuStockMarkets[1:10,]; df1 #EuStockMarkets라는 built-in data set에서 1~10까지의 열을 선택

my_list <- list(vect, mat, df1); my_list
my_list[[2]] #'[[]]'는 특정 index의 element를 직접 반환하고, '[]'는 해당 index를 포함하는 list나 vector를 반환함

PATH <- 'https://raw.githubusercontent.com/guru99-edu/R-Programming/master/prison.csv' #online에서 이용 가능한 R data set
prison <- read.csv(PATH)[1:5]
head(prison, 5) #data frame의 상단을 표시
str(prison)
#apply() 함수의 목적은 주로 loop 구조의 명시적 사용을 피하게 하는 것
apply(x, MARGIN, FUN)
#x: list 혹은 matrix
#MARGIN: 함수를 어디에 적용할지를 정하기 위해 1과 2사이의 값이나 범위를 취함
#     -> MARGIN=1: 행단위로 조작이 이루어짐
#     -> MARGIN=2: 열단위로 조작이 이루어짐
#     -> MARGIN=c(1,2): 행과 열단위로 조작이 이루어짐
#FUN: 어떤 함수를 적용할지 정함

m1 <- matrix(c <- (1:10), nrow = 5, ncol = 6)
a_m1 <- apply(m1, 2, sum); a_m1 #matrix의 모든 column에 대해 합을 구함

lapply(x, FUN) #list apply를 의미하며, 출력 결과가 list임
movies <- c("SPYDERMAN", "BATMAN", "VERTIGO", "CHINATOWN")
movies_lower <- lapply(movies, tolower)
str(movies_lower)

sapply(x, FUN) #lapply()와 같은 일을 하지만 vector로 반환함
dt <- cars
lmn_cars <- lapply(dt, min) #각 요소의 결과가 개별 리스트로 나열됨됨
smn_cars <- sapply(dt, min) #하나의 vector로 단순화됨
lmx_cars <- lapply(dt, max)
smx_cars <- sapply(dt, max)

avg <- function(x) {
  (min(x) + max(x)) / 2
}
fcars <- sapply(dt, avg); fcars

below_ave <- function(x) {
  ave <- mean(x)
  return(x[x > ave])
}
dt_s <- sapply(dt, below_ave)
dt_l <- lapply(dt, below_ave)
identical(dt_s, dt_l)

tapply(x, INDEX, FUN = NULL)
#x: 오브젝트, 주로 vector
#INDEX: factor를 포함하는 list
#FUN: x의 각 요소에 적용되는 함수

data(iris)
tapply(iris$Sepal.Width, iris$Species, median)
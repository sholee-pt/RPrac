x <- 28
class(x)
str(x) #structure의 약자: var의 형식을 반환함

x1 <- 2.8
x/x1

y <- "Test Message"
class(y)
str(y)

z <- TRUE
class(z)
str(z)

array_num <- c(1,10,49); array_num #뒤에 ;붙이고 바로 다음 line 작성 가능
typeof(array_num)
is.integer(array_num)
is.atomic(array_num) #원자성(기본 data type에 속하는지)을 판단하여 bool 반환

#R에서의 array는 vector라고도 함
array_chr <- c("a", "b", "c") #c는 combine의 약자
array_chr

array_bool1 <- c(TRUE, FALSE, TRUE); array_bool
as.numeric(array_bool1) #SQL문처럼, 바꿔서 반환해주는 개념

str(c(1,"a"))

vect_1 <- c(1, 3, 5)
vect_2 <- c(2, 4, 6)
vect_sum <- vect_1+vect_2; vect_sum
c(vect_1, vect_2) #순차적으로 출력

vect_logi <- 1:10
vect_logi > 5
vect_logi[(vect_logi>4)&(vect_logi<7)]

vect_slice <- seq(1,10, by=2); vect_slice
length(vect_slice) #벡터의 길이(element의 갯수수) 확인
vect_slice[3:7] #index가 3에서 7까지인 원소를 출력 
vect_slice[which(vect_slice%%3!=0)] #which문으로 조건 추가]

seq(1:10) #c()는 vector를 생성하고, seq()는 sequence의 약자로 숫자 시퀀스를 생성
seq(0, 1, length.out = 11)
seq(stats::rnorm(20)) #20개의 random한 value들을 생성, 비추천
seq(1, 9, by = 2) #by는 element들 간의 차이, 즉, 간격을 의미
seq(1, 9, by = pi)
seq(1, 6, by = 3)
seq(1.575, 5.125, by = 0.05)
seq(17) #시작과 끝값이 정의되지 않으면 default로 1부터 1씩 증가하는 seq생성

rep("*", 7) #rep은 repeat의 약자로, 반복적 요소 생성
rep(1:4) #반복횟수 지정 안해주면 default로 1번만 출력
rep(1:4, 2) #전체를 2번 반복
rep(1:4, each = 2) #각각의 요소를 2번씩 반복
rep(1:4, c(2, 2, 2, 2)) #vector는 각 요소가 반복될 횟수를 지정
rep(1:4, c(2, 1, 2, 1))
rep(1:4, each = 2, len = 4) #len이 더 짧으면 앞에서부터 len까지만 출력
rep(1:4, each = 2, len = 10) #len이 더 길면 재귀호출하여 len까지 출력
rep(1:4, each = 2, times = 3) #each가 적용된 seq을 times만큼 반복

rep(1, 40*(1-.8)) #대부분의 platform에서는 7번 출력
rep(1, 40*(1-.8)+1e-7) #1e-7이라는 매우 작은 값을 추가해줌으로써 한번 더 반복되어 8번 출력

xx <- c(a=1, b=2, c=3); xx #vetor를 생성할 때 요소별로 이름 붙이기
yy <- c(1, 2, 3); yy
names(yy) <- c("a", "b", "c"); yy #이미 생성된 vector의 요소에 names() 함수를 이용하여 이름 붙이기
zz <- c(1:4); zz
names_zz <- c("a", "b", "c", "d"); names_zz
setNames(zz, names_zz) #vector나 list의 요소에 이름을 지정하는 함수
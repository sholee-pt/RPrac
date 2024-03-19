t.test(x, y = NULL, mu = 0, var.equal = FALSE)
#x: 단일표본 t-검정 계산을 위한 vector
#y: 두 표본 t-검정을 계산하기 위한 2번째 vector
#mu: 모집단의 평균
#var.equal: 두 vector의 분산이 같은지 설정, default는 FALSE

rnorm(n, mean, sd)
#n: 생성하는 관측치 수
#mean: 분포의 평균, 선택사항
#sd: 분포의 표준편차, 선택사항

#단일 t-검정정
set.seed(123)
sugar_cookie <- rnorm(30, mean = 9.99, sd = 0.04)
head(sugar_cookie)
t.test(sugar_cookie, mu = 10)

#쌍대 t-검정정
set.seed(123)
sales_before <- rnorm(7, mean = 50000, sd = 50)
sales_after <- rnorm(7, mean = 50075, sd = 50)
t.test(sales_before, sales_after, var.equal = TRUE)
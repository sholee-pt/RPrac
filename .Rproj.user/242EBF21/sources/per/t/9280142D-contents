matrix(data, nrow, ncol, byrow = FALSE)
#row: 행, column: 열, byrow: TRUE, FALSE에 따라 data를 가로로 채우냐, 세로로 채우냐 결정

a <- matrix(1:10, nrow = 5, byrow = FALSE); a
a1 <- cbind(a, 1:5); a1 #cbind는 column bind의 약자로, matrix에 열을 추가함 
a2 <- matrix(13:24, ncol = 3, byrow = FALSE); a2
dim(a) #dimension의 약자로, 해당 matrix의 차원을 출력
nrow(a) #행의 갯수 확인
ncol(a) #열의 갯수 확인

b <- matrix(1:10, nrow = 5, byrow = TRUE); b
c <- matrix(1:12, nrow = 4, ncol = 3, byrow = FALSE); c
c1 <- cbind(a2, c); c1 #c matrix의 column방향으로 결합되기 때문에 dimension이 변경됨
dim(c1)
c2 <- rbind(c, 1:3); c2 #rbind는 row bind의 약자로, matrix에 행을 추가함
dim(c2)

d <- 1:6
dim(d) <- c(3, 2) #byrow의 default는 FALSE, 즉, 세로로 채우기임

rownames(a) <- c("Row 1", "Row 2", "Row 3", "Row 4", "Row 5")
colnames(a) <- c("Col 1", "Col 2")

c[1,2] #1번째 행과 2번째 열의 element select
c[1:3, 2:3] #1~3행과 2~3열의 data로 이루어진 matrix
c[,1] #1번째 열의 모든 element select
c[1,] #1번째 행의 모든 element select
c[,-1] #1번째 행을 제외한 모든 element select
c[-1,] #1번째 열을 제외한 모든 element select
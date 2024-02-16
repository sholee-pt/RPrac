data.frame(df, stringsAsFactors = TRUE)
#df: data frame으로 변환될 matrix 또는 결합될 변수의 집합일 수 있음
#stringAsFactors: string을 factor로 변환(default값은 TRUE)

df <- data.frame(c("John", "Anna", "Peter", "Linda"), c(25, 30, 35, 28), c("M", "F", "M", "F"), c("P", "P", "F", "P"))
#names() 함수를 이용하여 column의 이름을 변경할 수 있음
names(df) <- c('name', 'age', 'gender', 'test')
str(df) #기본적으로 data frame은 문자열 변수를 factor로 변환함

#data frame의 분할: df[rows, columns]
df[1,2] #2열에 있는 1행 선택
df[1:2,] #1~2행까지 선택
df[,1] #1열 선택
df[2:3, 2:3] #2~3행까지, 2~3열까지 선택
df[, c("age", "test", "gender")] #열의 이름을 column slice 가능

quantity <- c(10, 35, 40, 5)
df$quantity <- quantity; df #'$'기호를 이용하여 새로운 var(column) 추가 가능, matrix에서 사용하였던 cbind도 사용 가능
df$gender #'$'기호는 단일 column을 선택하는 데 사용

subset(x, condition)
#x: 부분집합 수행에 사용될 data frame
#condition: 조건문을 정의
subset(df, subset = age < 30) #age가 30보다 작은 항목들만 출력
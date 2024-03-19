read.csv(file, header = TRUE, sep = ",")
#file: 파일이 저장된 PATH
#header: 파일이 헤더를 가지고 있는지 확인, default는 TRUE
#sep: 변수를 구분짓는데 사용되는 기호, default는 ','

PATH <- 'https://raw.githubusercontent.com/guru99-edu/R-Programming/master/mtcars.csv'
df <- read.csv(PATH, header = TRUE, sep = ',', stringsAsFactors = FALSE) #stringAsFactors = FALSE를 추가하면 기본적으로 문자 값을 factor로 반환하는 R의 설정을 해제할 수 있음
class(df$x)

library(readxl)
read_excel(PATH, sheet = NULL, range = NULL, col_names = TRUE)
#PATH: 엑셀 파일이 위치한 경로
#sheet: 불러올 시트를 선택, default는 all
#range: 불러올 범위를 선택, default는 non-null인 모든 cell
#col_names: 열 이름을 불러올지에 대한 여부, default는 non-null인 모든 column, header라고도 함함

example <- readxl_example("datasets.xlsx")
df <- read_excel(example)
length(df)

excel_sheets(example)
quake <- read_excel(example, sheet = 'quakes')
quake_1 <- read_excel(example, sheet = 4)
identical(quake, quake_1) #sheet의 이름이나 인수로 sheet 지정 가능

iris <- read_excel(example, n_max = 5, col_names = TRUE)
iris_no_header <- read_excel(example, n_max = 5, col_names = FALSE) #header를 지정해주지 않으면 R자체에서 이에 상응하는 변수를 생성하고, 기존의 header는 row로 내려감
iris_row_with_header <- read_excel(example, range = cell_rows(2:3), col_names = TRUE)
iris_row_no_header <- read_excel(example, range = cell_rows(2:3), col_names = FALSE)

example_1 <- read_excel(example, range = "A1:B5", col_names = TRUE)
dim(example_1)
example_2 <- read_excel(example, range = cell_rows(1:5), col_names = TRUE)
dim(example_2)
col <- read_excel(example, range = cell_cols("A:B"))
dim(col)

iris_na <- read_excel(example, na = "setosa") #na: NA값으로 처리할 값을 지정하는 매개변수
sum(is.na(iris_na)) #NA값의 총 개수

library(haven)
PATH_sas <- 'https://github.com/guru99-edu/R-Programming/blob/master/binary.sas7bdat?raw=true'
df <- read_sas(PATH_sas)
head(df)

PATH_stata <- 'https://github.com/guru99-edu/R-Programming/blob/master/binary.dta?raw=true'
df <- read_dta(PATH_stata)
head(df)

PATH_spss <- 'https://github.com/guru99-edu/R-Programming/blob/master/binary.sav?raw=true'
df <- read_sav(PATH_spss)
head(df) #head()는 default로 6개의 row를 return
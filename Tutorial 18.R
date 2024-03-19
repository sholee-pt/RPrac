directory <- getwd()

library(dplyr)
df <- mtcars %>% select(mpg, disp, gear) %>% group_by(gear) %>% summarize(mean_mpg = mean(mpg), mean_disp = mean(disp))
write.csv(df, "C:/Rfiles/table_car.csv")

open_folder <- function(dir) {
  if (.Platform['OS.type'] == "windows") {
    shell.exec(dir)
  } else {
    system(paste(Sys.getenv("R_BROWSER"), dir))
  }
}
open_folder("C:/Rfiles")

library(xlsx)
write.xlsx(df, "C:/Rfiles/table_car.xlsx")

library(haven)
write_sav(df, "C:/Rfiles/table_car.sav")
write_sas(df, "C:/Rfiles/table_car.sas7bdat")
write_dta(df, "C:/Rfiles/table_car.dta")

save(df, file = 'C:/Rfiles/table_car.RData') #RData: data frame이나 R object를 저장함

library(googledrive)
drive_upload(file, path = NULL, name = NULL)
#file: 업로드할 파일의 확장자 포함 이름
#path: 파일의 위치로, 원하면 이름을 다시 붙일 수 있음, default는 local 경로

library(googledrive)
drive_upload("tabe_car.csv", name = "table_car")
drive_browse("table_car") #google 스프레드시트로 보기

x <- drive_get("table_car")
as_id(x)

drive_download(file, path = NULL, overwrite = FALSE)
#file: download할할 파일명 또는 파일 ID
#path: download받을 경로, default는 working directory에 google drive에 있는 파일명으로 저장됨
#overwrite = FALSE: 파일이 이미 존재하면, 덮어쓰지 않는다. TRUE로 설정하면 이전의 파일이 새 파일로 대체됨

download_google <- drive_download(as_id(x), overwrite = TRUE)
#drive_download(): google drive에서 파일을 download하는 함수
#as_id(x): google drive에 있는 파일을 찾기 위해 ID를 사용
#overwrite = TRUE: file이 존재하면 덮어쓰고 그렇지 않으면 중지, local에 있는 file의 이름을 보고 싶으며 사용할 수 있음

google_file <- download_google$local_path
path <- paste(google_file, ".csv", sep = "")
google_table_car <- read.csv(path)
drive_find("table_car") %>% drive_rm()

library(rdrop2)
#r version과의 호환성 문제로 인한 중단
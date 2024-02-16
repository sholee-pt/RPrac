merge(x, y, by.x = x, by.y = y)
#x: 원래의 data frame
#y: merge할 data frame
#by.x: x에서 결합에 사용되는 열, 결합된 결과는 x열로 표시됨
#by.y: y에서 결합에 사용되는 열, 결합된 결과는 y열로 표시됨

producers <- data.frame(surname = c("Spielberg", "Scorsese", "Hitchcock", "Tarantino", "Polanski"), nationality = c("US", "US", "UK", "US", "Poland"), stringsAsFactors = FALSE)
movies <- data.frame(surname = c("Spielberg", "Scorsese", "Hitchcock", "Hitchcock", "Spielberg", "Tarantino", "Polanski"), title = c("Super 8", "Taxi Driver", "Psycho", "North by Northwest", "Catch Me If You Can", "Reservoir Dogs", "Chinatown"), stringsAsFactors = FALSE)
m1 <- merge(producers, movies, by.x = "surname")
colnames(movies)[colnames(movies) == 'surname'] <- 'name' #surname 열 이름을 name으로 변경
m2 <- merge(producers, movies, by.x = "surname", by.y = "name")
identical(m1, m2) #완전 대응(full matching)

add_producer <- c('Lucas', 'US')
producers <- rbind(producers, add_producer)
m3 <- merge(producers, movies, by.x = "surname", by.y = "name", all.x = TRUE); m3
while (condition) {
  Exp
}

begin <- 1
while (begin <= 10) {
  cat('This is loop number', begin)
  begin <- begin + 1
  print(begin)
}

set.seed(123)
stock <- 50
price <- 50
loop <- 1
while (price > 45) {
  price <- stock + sample(-10:10, 1)
  print(loop)
  loop <- loop + 1
}
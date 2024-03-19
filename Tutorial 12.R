if (condition) {
  Expr1
} else {
  Expr2
}
 
#java와 달리 R에서는 else if 대신 elif를 사용할 수 없음
quantity <- 25
if (quantity > 20) {
  print('You sold a lot!')
} else {
  print('Not enough for today')
}

category <- 'A'
price <- 10
if (category == 'A') {
  cat('A vat rate of 8% is applied.','The total price is ',price*1.08)
} else if (category == 'B') {
  cat('A vat rate of 10% is applied.','The total price is ',price*1.10)
} else {
  cat('A vat rate of 20% is applied.','The total price is ',price*1.20)
}
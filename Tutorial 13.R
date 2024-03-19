for (i in vector) {
  Exp
}

fruit <- c('Apple', 'Orange', 'Passion fruit', 'Banana')
for (i in fruit) {
  print(i)
}

list <- c()
for (i in seq(1, 4, by=1)) {
  list[i] <- i*i
}
print(list)

fruit <- list(Basket = c('Apple', 'Orange', 'Passion fruit', 'Banana'), Money = c(10, 12, 15), purchase = FALSE)
for (p in fruit) {
  print(p)
}

mat <- matrix(data = seq(10, 20, by=1), nrow = 6, ncol = 2)
for (r in 1:nrow(mat)) {
  for (c in 1:ncol(mat)) {
    print(paste("Row", r, "and column", c, "have values of", mat[r,c]))
  }
}

draw_tree <- function(height) {
  for (i in 1:height) {
    # 공백 출력
    cat(rep(" ", height - i), sep = "")
    # 별표 출력
    for (j in 1:(2*i - 1)) {
      cat("*")
    }
    cat("\n")
  }
}
draw_tree(5)
sort(x, decreasing = FALSE, na.last = TRUE)
#x: 연속 또는 factor 변수를 포함하는 vector
#decreasing: 정렬 방법의 순서를 제어, default로 decreasing 값은 FALSE로 설정되어 있음
#na.last: NA의 값을 마지막에 넣어야 하는지 여부를 표시

sort_sample <- c(3, 1, 5, NA, 2, 4)
sorted_sample <- sort(sort_sample, decreasing = FALSE, na.last = FALSE); sorted_sample
# 4.3 R1
mlr <- function(b0, b1, b2, x1, x2) {
  result <- exp(b0 + b1*x1+b2*x2) / (1 + exp(b0 + b1*x1 + b2*x2))
  print(result)
}

# 4.3 R2
ml <- function(p, b0, b1, b2, x1=FALSE, x2=FALSE) {
  if (x1 == FALSE & x2 == FALSE){
    result = 'Check Inputs.'
  } else {
    if(x1 == FALSE) {
      result <- (log(p/(1-p)) - b0 - b2*x2) / b1
    } else if (x2 == FALSE) {
      result <- (log(p/(1-p)) - b0 - b1*x1) / b2
    }
  }
  print(result)
}

# 4.3 R1
mlr(-6, 0.05, 1, 40, 3.5)
# 4.3 R2
ml(0.5,-6,0.05,1, x2=3.5)

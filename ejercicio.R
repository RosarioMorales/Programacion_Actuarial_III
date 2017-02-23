#FORMATOS DE TEXTO

y <- data.frame(a=1, b="a")
dput(y)
dput(y,"y.R")
y <- dget("y.R")

#dump source
x <- "Programacion Actuarial III"
w <- data.frame(a=1:10, b="a")
dump (c("x","y"), file="data.R")
source("data.R")
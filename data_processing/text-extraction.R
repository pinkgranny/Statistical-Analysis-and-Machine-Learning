my.data <- c("aaa", "b11", "b21", "b101", "b111", "ccc1", "ddd1", "ccc20", "ddd13")
gsub("[[:digit:]]","",my.data)

#install.package("stringr")

library(stringr)
my.data.num <- as.numeric(str_extract(my.data, "[0-9]+"))
my.data.cha <- (str_extract(my.data, "[aA-zZ]+"))

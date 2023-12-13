library(tidyverse)

raw <- read_csv("vietnam-health.csv")
data <- raw
# code response factor levels
data$RecPerExam <- factor(data$RecPerExam, levels = c("unknow", "less12", 
                                                      "b1224", "g24"))

data <- data[data$RecPerExam != "unknow", ]

save(data, file = "data.rda")
library(tidyverse)

raw <- read_csv("vietnam-health.csv")
data <- raw
# filter out some values
data <- data[data$RecPerExam != "unknow", ]
data <- data[data$ReaExam != "request", ]
# refactor RecPerExam
data$RecPerExam <- factor(data$RecPerExam, 
                          levels = c("b1224", "g24", "less12"), 
                          labels = c("12-24 mo", "> 24 mo", "< 12 mo"))

# rename Respon
data$Timeliness <- data$Respon
data$Respon <- NULL

save(data, file = "data.rda")

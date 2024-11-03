data <- read.csv("data/quiz1.csv", sep = ";", na.strings = c("", "NA"))

head(data)

sapply(data, function(y) sum(is.na(y)))
data[duplicated(data) | duplicated(data, fromLast = TRUE)]

# Q1
VALID_DEPT = c(76, 27, 14)
mask = !data$Dept %in% VALID_DEPT
data[mask,]

data[mask, "Dept"] = NA
data[is.na(data$Dept),]

# Q2
sapply(data, function(y) sum(is.na(y)))

# Q3
data$Temps = as.POSIXct(data$Temps, format = "%H:%M:%S")
head(data)
data[is.na(data$Temps),]
data[251,]

# Q4
data[1:340,]
head(data, getOption("max.print"))
data[167:340,]
data[333:340,]

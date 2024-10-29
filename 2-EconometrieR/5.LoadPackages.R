library(readr)
diabetes <- read_csv("C:/Documents/HugoC/Git/Learning/r-rstudio-SelfLearning/2-EconometrieR/data/diabetes.csv")

install.packages("ggplot2", dependencies = TRUE)
library(ggplot2)
ggplot(diabetes, aes(diabetes$BMI, diabetes$Glucose)) + geom_point()

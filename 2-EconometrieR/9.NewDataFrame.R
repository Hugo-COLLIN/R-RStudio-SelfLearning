library(readr)
diabetes <- read_csv("C:/Documents/HugoC/Git/Learning/r-rstudio-SelfLearning/2-EconometrieR/data/diabetes.csv")

install.packages("DataExplorer")
library(DataExplorer)

# Analyse des corrélations
plot_correlation(diabetes)

new_diabetes <- data.frame(diabetes$Glucose, diabetes$BMI, diabetes$Pregnancies, diabetes$Age, diabetes$Outcome)

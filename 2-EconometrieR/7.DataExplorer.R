library(readr)
diabetes <- read_csv("C:/Documents/HugoC/Git/Learning/r-rstudio-SelfLearning/2-EconometrieR/data/diabetes.csv")

install.packages("DataExplorer")
library(DataExplorer)

# 1) Survol des données
summary(diabetes)
plot_density(diabetes)

# 2) Analyse des corrélations
plot_correlation(diabetes)
plot_boxplot(diabetes, by="Outcome")

plot_histogram(diabetes)

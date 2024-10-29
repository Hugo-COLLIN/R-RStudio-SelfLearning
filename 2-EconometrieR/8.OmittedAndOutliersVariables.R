library(readr)
diabetes <- read_csv("C:/Documents/HugoC/Git/Learning/r-rstudio-SelfLearning/2-EconometrieR/data/diabetes.csv")

install.packages("DataExplorer")
library(DataExplorer)

# Analyse des corrélations
plot_density(diabetes)

# Nouvelle matrice de données
new_diabetes <- diabetes[diabetes$BMI != 0 ,]
new_diabetes <- diabetes[diabetes$BloodPressure != 0 ,]
# Lors du recueil stat, mettre un NA au lieu d'un 0 lorsqu'on ne connait pas la valeur
new_diabetes <- na.omit(new_diabetes) # enlève les lignes contenant des NA
plot_density(new_diabetes)

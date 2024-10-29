#########################
#  Regression linéaire  #
#########################

# Importer les données
library(wooldridge)

data <- wooldridge::wine
data <- data.frame(data[,4], data[,2])
colnames(data) = c("mortalite", "consommation")

plot(data$consommation, data$mortalite)


# Faire la régression linéaire

modellineaire <- lm(data$mortalite~data$consommation)
summary(modellineaire)


# Observations graphiques

plot(data$consommation, data$mortalite)
abline(239.147, -19.683)

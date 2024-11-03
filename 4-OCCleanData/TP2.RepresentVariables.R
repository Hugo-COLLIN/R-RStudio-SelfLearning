# https://chatgpt.com/c/6726acd6-22dc-8008-a532-a0f1e9fd6ad9

# --- 2. REPRESENT AS A TABLE ---

data <- read.csv("data/quiz1.csv", sep = ";", na.strings = c("", "NA"))

# Calcul des effectifs par modalité
effectifs <- table(data$Sexe)

# Extraire les modalités
modalites <- names(effectifs)

# Création du tableau en utilisant les modalités et les effectifs
tab <- data.frame(Sexe = modalites, n = as.vector(effectifs))

# Calcul de la fréquence relative
tab$f <- tab$n / nrow(data)




# --- 3. Mesures de tendances centrales ---
data$Temps_secondes <- as.numeric(data$Temps_secondes)

# Calcul du Mode statistique
mode <- as.numeric(names(sort(table(data$Temps_secondes), decreasing = TRUE)[1]))

# Calcul de la moyenne
moy <- mean(data$Temps_secondes, na.rm = TRUE)

# Calcul de la médiane
med <- median(data$Temps_secondes, na.rm = TRUE)



# --- 5. Comprendre les mesures de dispersion ---

# Calcul de la variance avec estimateur non-biaisé (par defaut ddof=1 en R)
variance <- var(data$Temps_secondes, na.rm = TRUE)

# Calcul de l'écart-type
standard_deviation <- sd(data$Temps_secondes, na.rm = TRUE)

# Calcul du coefficient de variation
var_coeff <- standard_deviation / moy

# Boxplot horizontal 
boxplot(data$Temps_secondes, horizontal = TRUE, main = "Boîte à moustache du montant", xlab = "Montant")


# --- 6. Mesures de forme ---
# Charger la bibliothèque nécessaire pour skewness et kurtosis
if (!requireNamespace("e1071", quietly = TRUE)) install.packages("e1071")
library(e1071)

# Calcul de l'asymétrie (skewness)
skew_montant <- skewness(data$montant, na.rm = TRUE)

# Calcul de la kurtosis
kurtosis_montant <- kurtosis(data$montant, na.rm = TRUE)



# --- 7. Mesures de concentration ---

# -- Courbe de Lorenz --
data = read.csv('data/operations.csv',
                stringsAsFactors = FALSE, # pour éviter de travailler avec des Factors et faciliter les traitements
                fileEncoding = "UTF-8", # spécifier l'encodage du fichier
                na.strings=c("","NA"))
head(data)

# Filtrer les montants négatifs pour représenter les dépenses
depenses <- data[data$montant < 0 & !is.na(data$montant), ]
dep <- -depenses$montant
n <- length(dep)

# Calcul de la courbe de Lorenz
lorenz <- cumsum(sort(dep)) / sum(dep)
lorenz <- c(0, lorenz) # La courbe de Lorenz commence à 0

# Définir l'axe des x pour la courbe de Lorenz
xaxis <- seq(0, 1, length.out = n + 1)

# Tracer la courbe de Lorenz
plot(xaxis, lorenz, type = "s", main = "Courbe de Lorenz des Dépenses", 
     xlab = "Part Cumulée des Individus", ylab = "Part Cumulée des Dépenses")


# -- Indice de Gini --



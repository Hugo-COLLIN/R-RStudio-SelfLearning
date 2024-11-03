########################################################
# Partie 2.1 - Désaisonnaliser par Régression Linéaire #
########################################################

x=AirPassengers
y=log(x)

t=1:144

for (i in 1:12) {
  su = rep(0, times=12)
  su[i] = 1
  s = rep(su, times=12)
  assign(paste("s",i, sep = ""), s) # permet de créer une nouvelle variable indicée à chaque tour de boucle !!!
}

reg = lm(y~t+s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12-1)
summary(reg)

reg$coefficients
summary(reg)$coefficients

a = mean(reg$coefficients[2:13])
b = reg$coefficients[1]
c = reg$coefficients[2:13] - a

y_cvs = y - (c[1]*s1 + c[2]*s2 + c[3]*s3 + c[4]*s4 + c[5]*s5 + c[6]*s6 + c[7]*s7 + c[8]*s8 + c[9]*s9 + c[10]*s10 + c[11]*s11 + c[12]*s12)
x_cvs = exp(y_cvs)
ts.plot(x, x_cvs, xlab = "t", ylab = "Airpass", col=c(1,2), lwd=c(1,2))
legend("topleft", legend=c("X", "X_CVS"), col=c(1,2), lwd=c(1,2))


###############################################################
###############################################################

# Chargement des données
x = AirPassengers
y = log(x)

# Création d'un dataframe avec le temps et les mois
df <- data.frame(
  y = as.vector(y),
  time = 1:length(y),
  month = as.factor(cycle(y))
)

# Régression linéaire
model <- lm(y ~ time + month - 1, data = df)

# Extraction des coefficients saisonniers puis centrage
seasonal_effects <- coef(model)[grep("month", names(coef(model)))]
centered_seasonal_effects <- seasonal_effects - mean(seasonal_effects) # Centrage : remise à la même échelle que la série originale

# Calcul de la série désaisonnalisée
y_cvs <- y - centered_seasonal_effects[cycle(y)]

# Retransformation en série originale
x_cvs <- exp(y_cvs)

# Visualisation et export
png("out/airpass.png", width = 1000)

ts.plot(x, x_cvs, xlab="t", ylab="Airpass", col=c(1,2), lwd=c(1,2))
legend("topleft", legend=c("Original", "Désaisonnalisé"), col=c("black", "red"), lty=1)

dev.off() # Fermer le dispositif graphique pour finaliser l'image


# CVS = Corrigé variations Saisonnières
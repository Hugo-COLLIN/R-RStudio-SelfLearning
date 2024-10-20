#4.1 par (partage pour afficher plusieurs graphiques)

# Diviser les données par la colonne 'machine'
subsets <- split(data, data$machine)
subsets[[1]]

breaks <- seq(45, 46, by=0.1)
ylim <- c(0,50)

# par(mfrow=c(3,1))
par(mfrow=c(2,2))
for (i in 1:length(subsets)) {
  hist(subsets[[i]]$poids,
       breaks=breaks,
       main=paste("Histogramme - Machine", i),
       xlab="Poids (kg)",
       ylab="Fréquence",
       ylim = ylim
       )
}


# 4.2 Layout

layout(matrix(c(1,2,3,3), nrow = 2, ncol = 2, byrow = TRUE))

barplot(tapply(data$poids, data$machine, mean), ylim=c(0,100))
barplot(tapply(data$nonsense, data$machine, mean), ylim=c(0,100))
plot(data$poids, data$nonsense)


# 4.3 Sauvegarder

pdf("capsule43.pdf")

layout(matrix(c(1,2,3,3), nrow = 2, ncol = 2, byrow = TRUE))
barplot(tapply(data$poids, data$machine, mean), ylim=c(0,100))
barplot(tapply(data$nonsense, data$machine, mean), ylim=c(0,100))
plot(data$poids, data$nonsense)

dev.off()



# 4.4 Ajout de texte dans la marge

# ??? Marche pas
par(mfrow=c(1,1))
plot(data$poids)
text(120,110,"Ceci est un texte", xpd=TRUE)

# ??? Marche pas
par(mar=c(5,4,4,2))
plot(data$poids, data$nonsense)
text(120,110,"Ceci est un texte", xpd=TRUE)

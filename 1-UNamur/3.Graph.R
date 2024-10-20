# 3.1 Graphiques
class(df$Taille)

plot(df$Taille)
barplot(table(df$Genre)) # plot(df$Genre) ne fonctionne pas

plot(df$Taille, df$Age) # diagramme de dispersion

plot(as.factor(df$Genre), df$Taille) # diagramme boxplot (boîtes à moustache)

plot(df$Age, df$Taille, #données
     main="Taille des individus en fonction de leur âge", # Titre pricipal du graphique
     xlab="Age (ans)", #Légende axe X
     ylab="Taille (cm)", # Légende Axe Y
     xlim = c(0,80), # étendue de l'axe X
     ylim = c(150,190), # étendue de l'axe Y
     bty="n", # encadrement du graphique ("n" => pas encadré)
     )

# 3.2 Graphique circulaire
table(df$Genre)->GenreProp
pie(GenreProp)
pie(GenreProp, labels=c("Femmes", "Hommes")) # <!> Ordre des labels !!!

# 3.3 Diagramme en barres
head(data)

moy.reg <- tapply(data$nonsense, data$machine, mean)

barplot(moy.reg, ylab="IMC")

barplot(moy.reg, ylab="IMC", 
        names.arg = c("Machine 1", "Machine 2", "Machine 3", "Machine 4", "Machine 5", "Machine 6", "Machine 7", "Machine 8"),)
        
barplot(moy.reg, ylab="IMC", 
        names.arg = c("Machine 1", "Machine 2", "Machine 3", "Machine 4", "Machine 5", "Machine 6", "Machine 7", "Machine 8"),
        ylim=c(16,26), 
        xpd = FALSE, # les bâtons ne dépassent pas du graphique
        )

barplot(moy.reg, ylab="IMC", 
        names.arg = c("Machine 1", "Machine 2", "Machine 3", "Machine 4", "Machine 5", "Machine 6", "Machine 7", "Machine 8"),
        xlim=c(5,15), horiz=TRUE, # Graphique horizontal(<!> ylim => xlim)
        xpd = FALSE, # les bâtons ne dépassent pas du graphique
)

barplot(rev(moy.reg), ylab="IMC") # rev met les données dans l'ordre inverse
# <!> à l'ordre des étiquettes



# table.moy <- as.matrix(data.frame(A=c(17.8,18.6), B=c(21,21.6), C=c(24.4,23.6), row.names = c("F", "M")))

barplot(table.moy, ylab="IMC")
barplot(table.moy, ylab="IMC", 
        beside = TRUE, # barres affichées côte à côte au lieu de mpilées
        legend=TRUE, # afffiche al légende
        )


# 3.4 Histogramme
hist(data$nonsense)

hist(data$nonsense,
     main = "Répartition du non-sens dans l'échantillon",
     xlab = "IMC",
     ylab = "Frequence",
     breaks = 0:50,
     )

hist(data$nonsense,
     breaks = c(0:16,20:25,50),
)

hist(data$nonsense,
     breaks = 3,
)

hist(data$nonsense,
     breaks = 5, # suggestion, R choisit le plus adapté !
)


# 3.5 Chandeliers
boxplot(data$poids ~ data$machine) # ~ signifie "en fonction de"


boxplot(data$poids ~ data$machine, horizontal = TRUE)


# 3.6 Légendes
colo <- c(grey(0.05), grey(0.85))
barplot(mat, 
        beside=T,
        ylab="Titre axe Y", 
        col=colo,
)
legend("topleft", 
       legend = c("Étiquette 1", "Étiquette 2"), 
       fill=colo,
       title="Légende",
       box.lty = 0.0 # suppr bordures
       )

# 3.7
length(colors())
head(colors(),2)

barplot(moy.reg, col = "blue") # couleur des colonnes
barplot(moy.reg, col.lab = "blue", ylab = "test") # couleur des labels
barplot(moy.reg, col.axis = "blue") # couleur des étiquettes de graduation des axes
barplot(moy.reg, border = "blue") # couleur des bordures des colonnes

barplot(mat, 
        beside=T,
        ylab="Titre axe Y", 
        col=c("#ff9966", "blue"),
)

barplot(mat, 
        beside=T,
        ylab="Titre axe Y", 
        col=c(grey(0.5), grey(1)),
)


# 3.8 Gérer le texte

plot(df$Taille, df$Age, las=0) # Texte de graduation parallèle à leur axe

plot(df$Taille, df$Age, las=1) # Texte parallèle à l'axe x

plot(df$Taille, df$Age, las=2) # Texte perpendiculaire à leur axe

plot(df$Taille, df$Age, las=3) # Texte parallèle à l'axe y


plot(df$Taille, df$Age, cex.axis=0.4) # Taille du texte pour les graduation

plot(df$Taille, df$Age, cex.lab=0.4) # Taille du texte pour les noms des axes

plot(df$Taille, df$Age, main="titre graphique", cex.main=0.4) # Taille du texte pour le titre du graphique

plot(df$Taille, df$Age, cex=0.4) # Taille des points du graphique

plot(df$Taille, df$Age, pch=6) # Forme des points
# pch=0, pch=5, pch=6, pch=20, ...

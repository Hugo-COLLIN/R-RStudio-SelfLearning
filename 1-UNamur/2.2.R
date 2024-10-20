# 2.2

data<-read.table(file.choose(), sep = ";", dec=".", header=TRUE)

head(data)

data2<-read.table("examplePrepared.csv", sep = ";", dec=".", header=TRUE)

head(data2)


# 2.4

which(data$machine=="m1")

which(data$poids==45.43)

which(data$poids>45.43)

which.max(data$poids)

data$poids[which.max(data$poids)]

data$machine[which(data$machine=="m2")]<-"A"

data$machine <- as.numeric(gsub("m", "", data$machine))


#2.5

data$poids/(data$machine)^2

data$nonsense <- data$poids/(data$machine)^2


# 2.6

data.m3 <- subset(data, machine==1)

data.m3

# 2.7 

mat <- matrix(45:64, nrow = 5, ncol = 4)

df<-data.frame(Taille=c(152,179,163,168,185), Age=c(45,34,23,51,47), Genre=c("F", "M", "F", "F", "M"))

apply(mat, 1,sd) # appliquer la fonction sd sur toutes les lignes

apply(mat, 2, sd) # appliquer la fonction sd sur toutes les colonnes

tapply(df$Age, df$Genre, mean) # Applique la fonction moyenne sur df$Age en fonction de df$Genre



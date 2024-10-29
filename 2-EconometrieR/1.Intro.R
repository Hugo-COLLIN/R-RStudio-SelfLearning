library(wooldridge)
library(ggplot2)

Data <- wooldridge::beauty
ggplot(Data, aes(Data$looks, Data$wage)) + geom_point() + ggtitle("Effet de la beauté sur le salaire")
ggplot(Data, aes(Data$wage)) + geom_histogram(bins=100) + ggtitle("Distrib des salaires")

Graph <- ggplot(Data, aes(Data$looks, Data$wage)) + geom_point() + ggtitle("Effet de la beauté sur le salaire")

setwd("C:/Documents/HugoC/Git/Learning/r-rstudio-SelfLearning/2-EconometrieR")
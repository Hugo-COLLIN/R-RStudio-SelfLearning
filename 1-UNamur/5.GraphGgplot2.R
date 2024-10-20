# 5.2 Histogramme
library(gdata)

diet<-read.csv(file.choose(), 1) # diet.csv

diet
# data2$gender<-rep(c(rep("homme",20), rep("femme", 30)),3)
diet$diet.type[which(diet$diet.type=="A")]<-"Régime 1"
diet$diet.type[which(diet$diet.type=="B")]<-"Régime 2"
diet$diet.type[which(diet$diet.type=="C")]<-"Régime 3"
diet

library(ggplot2)

ggplot(data = diet, aes(x = final.weight))+
  geom_histogram(binwidth = 10)+
  facet_grid(diet.type~.)

ggplot(data = diet, aes(x = final.weight))+
  geom_histogram(binwidth = 10)+
  facet_grid(.~diet.type)

ggplot(data = diet, aes(x = final.weight))+
  geom_histogram(binwidth = 10)+
  facet_grid(gender~diet.type)


# 5.3 Esthétique des histogrammes

ggplot(data = diet, aes(x = final.weight, fill=gender))+
  geom_histogram(binwidth = 10)+
  facet_grid(gender~diet.type)

ggplot(data = diet, aes(x = final.weight, fill=gender))+
  geom_histogram(binwidth = 10)+
  facet_grid(gender~diet.type)+
  scale_fill_manual(values = c("red", "green")) # <!> par ordre alphabétique


# 5.4 Nuage de points

ggplot(data=diet, aes(x=final.weight, y=height))+
  geom_point()

ggplot(data=diet, aes(x=final.weight, y=height))+
  geom_point()+
  facet_grid(.~diet.type)

ggplot(data=diet, aes(x=final.weight, y=height))+
  geom_point()+
  facet_grid(gender~diet.type)


## 5.5 Esthétique des nuages de points

ggplot(data=diet, aes(x=final.weight, y=height, colour = gender))+
  geom_point()+
  facet_grid(.~diet.type)

ggplot(data=diet, aes(x=final.weight, y=height, colour = gender))+
  geom_point()+
  facet_grid(.~diet.type)+
  scale_colour_manual(values=c("red", "green"))


# 5.6 Esthétique générale des graphiques

ggplot(data=diet, aes(x=final.weight, y=height, colour = gender))+
  geom_point()+
  facet_grid(.~diet.type)+
  scale_colour_manual(values=c("red", "green"), name = "Sexe", label=c("Femme", "Homme"))+
  labs(title = "Graph title", x= "Masse (kg)", y = "Taille (cm)")+
  theme_bw()

ggplot(data=diet, aes(x=final.weight, y=height, colour = gender))+
  geom_point()+
  facet_grid(.~diet.type)+
  scale_colour_manual(values=c("red", "green"), name = "Sexe", label=c("Femme", "Homme"))+
  labs(title = "Graph title", x= "Masse (kg)", y = "Taille (cm)")+
  theme_bw()+theme(legend.position = "bottom")


ggplot(data = diet, aes(x = final.weight, fill=gender))+
  geom_histogram(binwidth = 10)+
  facet_grid(gender~diet.type)+
  scale_fill_manual(values=c("red", "green"), name = "Sexe", label=c("Femme", "Homme"))+
  labs(title="Histogramme", x= "Masse (kg)", y = "Fréquence")+
  theme_classic()+
  theme(legend.position = "bottom")

# 5.7 ggsave (Sauvegarde graphiques ggplot - alternative à vu précédemment)

ggsave("out/graphChap5.pdf", width = 10, height = 10)

# 6.1 Functions
a<-c(5,4,9,7,4)
freqrel <- function(freq){freq/sum(freq)*100}
freqrel(a)

freqrel <- function(freq){
  vfreqrel<-freq/sum(freq)*100
  barplot(vfreqrel, ylab="Fréquences relatives (%)", las=1)
}
freqrel(a)


# 6.2 if / ifelse

CotesCharles<-c(8,17,14)
CotesCharles
if(mean(CotesCharles) < 10) {"Echec"} else {"Réussite"}

CotesJustine<-c(4,11,7)
CotesJustine
if(mean(CotesJustine) < 10) {"Echec"} else {"Réussite"}


# ifelse s'applique aux vecteurs
df

df$Resultat<-ifelse(df$Age<50, "Jeune", "Agé")
df


# 6.3 for

for (i in 1:3) 2*i -> k

resultat<-rep(NA,3) # NA: valeur manquante
for (i in 1:3) 2*i -> resultat[i]
resultat

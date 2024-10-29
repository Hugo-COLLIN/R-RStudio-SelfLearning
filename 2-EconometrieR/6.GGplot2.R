library(readr)
diabetes <- read_csv("C:/Documents/HugoC/Git/Learning/r-rstudio-SelfLearning/2-EconometrieR/data/diabetes.csv")

# 2 dimensions : valeur en X (masse corpo) et valeur en Y (taux glucose)
plot(diabetes$BMI, diabetes$Glucose,
     main = "Glucose en fonction du BMI",
     xlab = "Masse corporelle",
     ylab = "Glucose")

library(ggplot2)
ggplot(diabetes, aes(diabetes$BMI, diabetes$Glucose)) + 
  geom_point() +
  ggtitle("Glucose en fonciton de la masse corporelle") +
  labs(x="Masse corporelle", y="Glucose")

# Tools > Install packages > "ggthemes"
library(ggthemes)
ggplot(diabetes, aes(diabetes$BMI, diabetes$Glucose)) +
  geom_point() +
  ggtitle("Glucose en fonction de la masse corporelle") +
  # theme_wsj() +
  theme_dark() +
  labs(x="Masse corporelle", y="Glucose")

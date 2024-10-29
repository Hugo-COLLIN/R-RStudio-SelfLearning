library(readr)
diet <- read_csv("C:/Documents/HugoC/Git/Learning/r-rstudio-SelfLearning/1-UNamur/data/diet.csv")

clean_dataset <- subset(diet, diet$diet.type!="A")

write.csv(clean_dataset, './out/clean_dataset.csv')

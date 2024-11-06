# 1) Série temporelle à partir d'un objet ts

head(AirPassengers)
class(AirPassengers)

plot(AirPassengers, main = "Evolution du nombre total de passagers")


# 2) Série temporelle à partir d'un dataframe

head(economics)
class(economics)

ts_plot <- ggplot(economics, aes(x = date)) +
  geom_line(aes(y = returns_perc)) +
  labs(title = "Evolution des rendements journaliers", y = "Rendement")

ts_plot

ggplot(ts_plot)



# 3) Graphiques en aires empilées

stacked_air_plot <- ggplot(economics, aes(date, unemploy)) +
  geom_area(position = 'stack')

stacked_air_plot

ggplotly(stacked_air_plot) # ????

# ---

library(gcookbook)
head(uspop)

stacked_air_plot2 <- ggplot(uspop, aes(Year, y = Tousands, fill = AgeGroup)) +
  geom_area()
stacked_air_plot2

ggplotly(stacked_air_plot2)

# I] Introduction aux séries temporelles

# --- 2) Objet ts ---
library(TSstudio)

data("USgas")
USgas

plot.ts(
  USgas,
  main = "Consommation totale mensuelle en gas naturel",
  ylab = "Milliards de pieds cubes"
)

# Nbr d'obs totales
length(USgas)

ts_info(USgas)


# --- 3) Dataframe => ts univarié/multivarié ---
library(TSstudio)
library(tidyverse)

# Créa série tempo fictive
my_ts <- ts(
  data = 1:60,
  start = c(2010,1),
  end = c(2014,12),
  frequency = 12
)

my_ts
ts_info(my_ts)

# Transfo df => ts
data("US_indicators")
class(US_indicators)
View(US_indicators)

str(US_indicators)
summary(US_indicators)

vehicle_sales <- US_indicators %>%
  select(Date, `Vehicle Sales`) %>%
  arrange(Date)
View(vehicle_sales)

point_depart <- c(year(min(vehicle_sales$Date)), month(min(vehicle_sales$Date)))
point_depart

frequence <- 12

# > ts (time series simple, 1 variable)
vehicle_sales_ts <- ts(
  data = vehicle_sales$`Vehicle Sales`,
  start = point_depart,
  frequency = frequence
)

vehicle_sales_ts
class(vehicle_sales_ts)
ts_info(vehicle_sales_ts)

plot.ts(
  vehicle_sales_ts
)

# > Mts (multiple time series, plusieurs variables)
US_indicators_mts <- US_indicators %>%
  arrange(Date) %>%
  select(-Date)

US_indicators_mts <- ts(
  data = US_indicators_mts,
  start = point_depart,
  frequency = frequence
)

View(US_indicators_mts)
head(US_indicators_mts)
class(US_indicators_mts)
ts_info(US_indicators_mts)


# --- 4) Sous-ensembles et aggrégation de données ---
data("USgas")
ts_info(USgas)

# > Sous-ensemble
USgas_restreint <- window(
  USgas,
  start = c(2010,1),
  end = c(2015,4)
)

ts_info(USgas_restreint)

# > Agrégation
USgas_year <- aggregate(
  USgas,
  nfrequency = 1,
  FUN = "sum"
)

ts_info(USgas_year)
USgas_year


# --- 5) Séries Retardées (lag) et Avancées (lead) ---
USgas_year

# (imaginer un curseur qui attrape la série et décale les valeurs à gauche ou droite)

# > Séries retardées (lag) (// lag streaming vidéo)
USgas_year_lag1 <- stats::lag(USgas_year, k = -1)
USgas_year_lag1

USgas_year_lag3 <- stats::lag(USgas_year, k = -3)
USgas_year_lag3

# > Séries avancées (lead)
USgas_year_lead1 <- stats:lag(USgas_year, k = 1)
USgas_year_lead1


# --- 6) Décomposition série tempo : Y(t) = Tendance(t) + Saisonnalité(t) + residus(t) ---

data("USVSales")
ts_info(USVSales)
head(USVSales)

ts_plot(USVSales) # Graphique interactif

# > Décomposition (ici et par défaut additive)
usv_decompose <- stats::decompose(USVSales)
str(usv_decompose)

plot(usv_decompose)
# ou
ts_decompose(USVSales) # Graphique interactif


# --- 7) Visualisation statique et interactive ---
library(TSstudio) #ts_plot backend Plotly
library(tidyverse) # plot.ts backend natif
library(dygraphs) # backend JS

# > Visualisation statique
plot.ts(
  vehicle_sales_ts,
  main = "Ventes mensuelles totales de vehic aux USA",
  xlab = "Date",
  ylab = "Milliers de véhicules"
)

plot.ts(
  US_indicators_mts,
  main = "Ventes mensuelles totales de vehic aux USA VS Taux de chômage",
  xlab = "Date",
  ylab = "Milliers de véhicules"
)
# ?plot.ts

# > Visualisation interactive avec dygraphs
dygraph( # Série univariée
  vehicle_sales_ts,
  main = "Ventes mensuelles totales de vehic aux USA",
  xlab = "Date",
  ylab = "Milliers de véhicules"
)

dygraph( # Sélecteur de période
  vehicle_sales_ts,
  main = "Ventes mensuelles totales de vehic aux USA",
  xlab = "Date",
  ylab = "Milliers de véhicules"
) %>%
  dyRangeSelector()


dygraph( # Série multivariée
  US_indicators_mts,
  main = "Ventes mensuelles totales de vehic aux USA VS Taux de chômage",
  xlab = "Date",
  ylab = "Milliers de véhicules"
) %>%
  dyAxis("y", label = "Ventes de voitures") %>%
  dyAxis("y2", label = "Taux de chômage") %>%
  dySeries("Vehicle Sales", axis = "y", color = "green") %>%
  dySeries("Unemployment Rate", axis = "y2", color = "red") %>%
  dyLegend(width = 400) %>%
  dyRangeSelector()

# > Visualisation interactive avec ts_plot (TSstudio)
ts_plot( # ???
  vehicle_sales_ts,
  title = "Ventes mensuelles totales de vehic aux USA",
  # xtitle = "Temps",
  # ytitle = "Milliers de véhicules",
  slider = TRUE
)


# II] Modélisation ARIMA

# Flux de travail :
# 1. Préparation des données
# 2. Entrainer le modèle
# 3. Tester le modèle
# 4. Evaluer le modèle

# --- 9) Construction puis analyse ---
library(TSstudio)

data("USgas")
ts_plot(USgas)

# > 1. Partition des données

USgas_partition <- ts_split(USgas)

train <- USgas_partition$train
test <- USgas_partition$test

ts_info(train)
ts_info(test)
ts_info(USgas)

library(forecast)

# > 2. Modèle ARIMA
md <- auto.arima(train)
md


# Series: train 
# ARIMA(1,0,0)(1,1,2)[12] 
# 
# Coefficients:
#   ar1     sar1     sma1     sma2
# 0.6430  -0.5680  -0.0912  -0.5406
# s.e.  0.0808   0.3297   0.3138   0.2236
# 
# sigma^2 = 10628:  log likelihood = -941.84
# AIC=1893.68   AICc=1894.08   BIC=1908.89

# Y(t) = ar1 * Y(t-1) + sar1 * Y(t-2) + sma1 * e(t-1) + sma2 * e(t-2) + e(t)


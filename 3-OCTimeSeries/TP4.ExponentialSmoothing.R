##################################
# Partie 3 - Lissage exponentiel #
##################################

library(forecast)

x = AirPassengers

# ets: model="     M         N         N       "
#              Constante Tendance Saisonnalité

# --- Lissage Exponentiel Simple ---
# - M : cste multiplicative 
# - N : pas de tendance linéaire (tendance nulle)
# - N : pas de saisonnalité
les = ets(x, model="MNN") 
# les = ets(x, model="ANN") 
les.pred = predict(les, 12)
plot(les.pred)

# Evaluer l'impact du coeff de lissage :
# <!> alpha=0.1 <=> coeff lissage = 0.9 <!>
les_alt1 = ets(x, alpha=0.1, model="MNN")
plot(les_alt1)

les_alt2 = ets(x, alpha=0.9, model="MNN")
plot(les_alt2)


# --- Lissage Exponentiel Double ---
led = ets(x, model="MMN")
led.pred = predict(led,12)
plot(led.pred)

# --- Méthode de Holt-Winters ---
hw = ets(x, model="MMM")
hw.pred = predict(hw,12)
plot(hw.pred)



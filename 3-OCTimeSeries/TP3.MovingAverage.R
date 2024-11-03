#################################
# Partie 2.2 - Moyennes mobiles #
#################################

x=AirPassengers
y=log(x)

decomp_y = decompose(y, type = "additive")
plot(decomp_y)

x_cvs = exp(y - decomp_y$seasonal)
ts.plot(x, x_cvs, xlab="t", ylab="Airpass", col=c(1,2), lwd=c(1,2))
legend("topleft", legend=c("X", "X_CVS"), col=c(1,2), lwd=c(1,2))

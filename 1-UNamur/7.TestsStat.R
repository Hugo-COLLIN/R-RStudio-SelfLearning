# 6.1 Chi-carré


head(data.chi)

# //tableau croisé dynamique sur Excel
table(data.chi$age, data.chi$telephone)->tableau

chisq.test(tableau)
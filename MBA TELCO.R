install.packages("arules")
library(arules)

setwd("E:\\IMS Course Content\\Course Content\\Data Science Term 1\\8. Market Basket Analysis\\Practice Case Study -20180620")
Telco <- read.transactions("Telecom.txt", format = "single", cols = c(1,2))

itemFrequencyPlot(Telco, topN = 20, type = "absolute")

rules = apriori(Telco, parameter = list(supp = 0.001, conf = 0.15))
summary(rules)

options(digits = 2)
rules = sort(rules, by="confidence", decreasing=TRUE)
inspect(rules[1:20])

rules = sort(rules, by="lift", decreasing=TRUE)
inspect(rules[1:20])

rules = apriori(data=Telco, parameter=list(supp=0.001,conf = 0.1), appearance = list(default="lhs",rhs="BlackBerry"))
summary(rules)
rules=sort(rules, decreasing=TRUE,by="confidence") 
inspect(rules[1:7])

#Plot the rules graph
plot(rules, method = "graph", interactive = FALSE, shading = NA)

rules = apriori(data=Telco, parameter=list(supp=0.001,conf = 0.1), appearance = list(default="rhs",lhs="BlackBerry"))
summary(rules)
rules=sort(rules, decreasing=TRUE,by="confidence") 
inspect(rules[1:6])

#Plot the rules graph
plot(rules, method = "graph", interactive = FALSE, shading = NA)

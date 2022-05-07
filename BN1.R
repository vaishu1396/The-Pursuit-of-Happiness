library(gRain)
library(Rgraphviz)
library(bnlearn)

ML_final <- read.csv(file = 'df_sa_geo_fin_bn_all.csv')
head(ML_final)
df = data.frame(ML_final)
df[1] <- NULL
names(df)
head(df)
df[] <- lapply(df, as.factor)
learned <- hc(df)
modelstring(learned)
score(learned, data = df, type = "bic")
learned2 <- hc(df, score = "bde")
score(learned2,data=df)
library(Rgraphviz)
graphviz.plot(highlight = c(),shape = 'rectangle',learned,main = 'Bayesian Network learned on World Happiness Data')

#next step
arc_str_df = data.frame(arc.strength(learned, data = df, criterion = "mi"))
df_bic = data.frame(arc.strength(learned, data = df, criterion = "bic"))

fitted = bn.fit(learned,df)

graphviz.chart(fitted, type = "barprob", layout = "dot", draw.levels = TRUE,
               grid = FALSE, scale = c(0.75, 1.1), col = "darkblue",
               text.col = "black", bar.col = "darkblue", main = "Bayesian Network(with Marginal Probabilities) learned on wellbeing Data",
               sub = NULL, bg = "azure" ,strip.bg = "lightskyblue")
# GeNIe style.
graphviz.chart(learned, col = "darkblue", bg = "azure", bar.col = "darkblue")

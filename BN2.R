str.raw = boot.strength(df, R = 20000, algorithm = "hc")
attr(str.raw, "threshold")
avg.raw.full = averaged.network(str.raw)
gR = strength.plot(avg.raw.full, str.raw, shape = "rectangle",main = 'NYC Well-being Bayesian Network averaged from 20000 networks')
nodeRenderInfo(gR)$fill = "lightblue"
edgeRenderInfo(gR)$col = "grey"
nodeRenderInfo(gR)$fill = "lightblue"
renderGraph(gR)

fitted = bn.fit(avg.raw.full,df)

graphviz.chart(fitted, type = "barprob", layout = "dot", draw.levels = TRUE,
               grid = FALSE, scale = c(0.75, 1.1), col = "darkblue",
               text.col = "black", bar.col = "darkblue", main = "Bayesian Network(with Marginal Probabilities) learned on wellbeing Data",
               sub = NULL, bg = "azure" ,strip.bg = "lightskyblue")




#,sub='Consensus Model by learning 10000 Bayesian networks and keeping the arcs that appear at least ≈ 50% of the time')
nrow(str.raw[with(str.raw, strength > 0.50 & direction > 0.50), ])
#nrow(str.raw[with(str.raw, strength > 0.90 & direction > 0.50), ])
min(str.raw[with(str.raw, strength > 0.50 & direction > 0.50), "direction"])
avg.raw.simpler = averaged.network(str.raw, threshold = 0.75)
strength.plot(avg.raw.simpler, str.raw, shape = "rectangle",main = 'Averaged Bayesian Network on World Happiness (Arcs having >50% strength)')


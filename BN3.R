library(lattice)
library(gridExtra)
junction <- compile(as.grain(bn.fit(avg.raw.full,df)))

summary(junction)

junction$Age.25+.Bachelors.Degree

querygrain(junction, nodes = "Well.Being.Score")$Well.Being.Score

learned_consensus = bn.fit(avg.raw.full,df)

#employment rate | education

jsex1 <- setEvidence(junction, nodes=c("Age.25..Bachelors.Degree"),states=c("low"))

querygrain(jsex1, nodes = "Employment.Rate")$Employment.Rate

jsex2 <- setEvidence(junction, nodes = "Age.25..Bachelors.Degree", states = "med")
querygrain(jsex2, nodes = "Employment.Rate")$Employment.Rate


jsex3 <- setEvidence(junction, nodes = "Age.25..Bachelors.Degree", states = "high")
querygrain(jsex3, nodes = "Employment.Rate")$Employment.Rate


p1 <- barchart(querygrain(jsex1, nodes = "Employment.Rate")$Employment.Rate, main = "Age.25+.Bachelors.Degree", xlim = c(0,1),xlab="Pr(Employment.Rate|Age.25+.Bachelors.Degree ='Low')")

p2 <- barchart(querygrain(jsex2, nodes = "Employment.Rate")$Employment.Rat, main = "Age.25+.Bachelors.Degree", xlim = c(0,1),xlab="Pr(Employment.Rate|Age.25+.Bachelors.Degree ='Med')")

p3 <- barchart(querygrain(jsex3, nodes = "Employment.Rate")$Employment.Rate, main = "Age.25+.Bachelors.Degree", xlim = c(0,1),xlab="Pr(Employment.Rate|Age.25+.Bachelors.Degree ='High')")

grid.arrange(p1, p2, p3, ncol = 3)


#House Price | education
jsex1 <- setEvidence(junction, nodes=c("Age.25..Bachelors.Degree"),states=c("low"))

querygrain(jsex1, nodes = "Median.House.Price")$Median.House.Price

jsex2 <- setEvidence(junction, nodes = "Age.25..Bachelors.Degree", states = "med")
querygrain(jsex2, nodes = "Median.House.Price")$Median.House.Price


jsex3 <- setEvidence(junction, nodes = "Age.25..Bachelors.Degree", states = "high")
querygrain(jsex3, nodes = "Median.House.Price")$Median.House.Price


p1 <- barchart(querygrain(jsex1, nodes = "Median.House.Price")$Median.House.Price, main = "Age.25+.Bachelors.Degree", xlim = c(0,1),xlab="Pr(Median.House.Price|Age.25+.Bachelors.Degree ='Low')")

p2 <- barchart(querygrain(jsex2, nodes = "Median.House.Price")$Median.House.Price, main = "Age.25+.Bachelors.Degree", xlim = c(0,1),xlab="Pr(Median.House.Price|Age.25+.Bachelors.Degree ='Med')")

p3 <- barchart(querygrain(jsex3, nodes = "Median.House.Price")$Median.House.Price, main = "Age.25+.Bachelors.Degree", xlim = c(0,1),xlab="Pr(Median.House.Price|Age.25+.Bachelors.Degree ='High')")

grid.arrange(p1, p2, p3, ncol = 3)

#well being | employment
jsex1 <- setEvidence(junction, nodes=c("Employment.Rate"),states=c("low"))

querygrain(jsex1, nodes = "Well.Being.Score")$Well.Being.Score

jsex2 <- setEvidence(junction, nodes = "Employment.Rate", states = "med")
querygrain(jsex2, nodes = "Well.Being.Score")$Well.Being.Score


jsex3 <- setEvidence(junction, nodes = "Employment.Rate", states = "high")
querygrain(jsex3, nodes = "Well.Being.Score")$Well.Being.Score


p1 <- barchart(querygrain(jsex1, nodes = "Well.Being.Score")$Well.Being.Score, main = "Well.Being.Score", xlim = c(0,1),xlab="Pr(Well.Being.Score|Age.25+.Bachelors.Degree ='Low')")

p2 <- barchart(querygrain(jsex2, nodes = "Well.Being.Score")$Well.Being.Score, main = "Well.Being.Score", xlim = c(0,1),xlab="Pr(Well.Being.Score|Age.25+.Bachelors.Degree ='Med')")

p3 <- barchart(querygrain(jsex3, nodes = "Well.Being.Score")$Well.Being.Score, main = "Well.Being.Score", xlim = c(0,1),xlab="Pr(Well.Being.Score|Age.25+.Bachelors.Degree ='High')")
grid.arrange(p1, p2, p3, ncol = 3)


bn.fit.barchart(learned_consensus$Well.Being.Score, main = "Well.Being.Score",xlab = "Pr(Life Ladder | Social Support,Healthy Life Expectancy)", ylab = "")
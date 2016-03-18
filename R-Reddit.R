Reddhit <- read.csv(file.choose())

str(Reddhit)

table(Reddhit$employment.status)

levels(Reddhit$marital.status)

levels(Reddhit$employment.status)

install.packages('ggplot2', dependencies = T)

library(ggplot2)

qplot(data=Reddhit,x=age.range)

qplot(data=Reddhit,x=employment.status)

qplot(data=Reddhit,x=income.range)

Reddhit$age.range <- factor(Reddhit$age.range, levels=c('Under 18','18-24',
                  '25-34','35-44','45-54','55-64','65 or Above'))

names(Reddhit)

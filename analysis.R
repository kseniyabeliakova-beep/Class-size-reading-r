load("/cloud/project/ARE106_HW5_S2025.Rdata")
library(AER)
# OLS model of class size and reading scores
model1 <- lm(log(avgread) ~ log(classize), data = D)
summary(model1)
# OLS model controlling for student disadvantage
model2 <- lm(log(avgread) ~ log(classize) + pct_dis, data = D)
summary(model2)
# First-stage regression and two-stage least squares
first_stage <- lm(log(classize) ~ log(m_rule) + pct_dis, data = D)
summary(first_stage)
library(AER)
model_2sls <- ivreg(log(avgread) ~ log(classize) + pct_dis | log(m_rule) + pct_dis, data = D)
summary(model_2sls)

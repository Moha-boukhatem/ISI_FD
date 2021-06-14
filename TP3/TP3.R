data = read.csv("/Users/book/Downloads/Learning/ISI_Python_S2/FD/TP3/50_Startups.csv")


data$Ville = factor(data$Ville,
            levels = c ('Alger','Oran','Annaba'),
            labels = c (1,2,3))


library(caTools)
set.seed(123)
split = sample.split(data$Profit,SplitRatio = 0.8)
training_set = subset(data,split ==TRUE)
test_set  = subset(data,split ==FALSE)

reg = lm(formula = Profit ~ ., data = training_set)

y_pred = predict (reg , newdata = test_set)

summary(reg)

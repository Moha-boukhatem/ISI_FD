data = read.csv('salaires.csv')
library('caTools')
set.seed(123)
split = sample.split(data$Salaire,SplitRatio=2/3)
training_set = subset(data,split==TRUE)
test_set = subset (data,split == FALSE)

model = ml(fomula=Salaire ~ AnnéesExperience,data=training_set)

y_pred = predict(model,newdata=test_set)
 
library(ggplot2)
ggplot()+
geom_point(aes(x=training_set$AnnéesExperience,y=training_set$Salaire),colour='red')+
geom_line(aes(x= training_set$AnnéesExperience,y=predict(model,newdata = training_set)),colour='blue')+
ggtitle('Salairevs Exprience')+xlab('Années')+ylab('Salaire')


library(ggplot2)
ggplot()+
geom_point(aes(x=test_set$AnnéesExperience,y=test_set$Salaire),colour='red')+
geom_line(aes(x= training_set$AnnéesExperience,y=predict(model,newdata = training_set)),colour='blue')+
ggtitle('Salairevs Exprience(test)')+xlab('Années')+ylab('Salaire')
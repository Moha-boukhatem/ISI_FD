data = read.csv('../data.csv')
data$Age = ifelse(is.na(data$Age),
            ave(data$Age,FUN = function(x) mean(x, na.rm=TRUE)),
            data$Age)

data$Salaire = ifelse(is.na(data$Salaire),
            ave(data$Salaire ,FUN = function(x) mean(x, na.rm=TRUE)),
            data$Salaire)


data$Pays = factor(data$Pays,
            levels = c('France','Espagne','Allemagne'),
            labels = c(1,2,3))
        

print(data)

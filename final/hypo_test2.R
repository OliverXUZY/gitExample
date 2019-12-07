data = 0
for(i in 1:20){
  a = read.csv(paste('res/map_operator',i-1,'.csv',sep = ''))
  rownames(a) = a$X
  a$X = NULL
  data = data + a
}
data = data/20

dt <- as.table(as.matrix(data))

library("vcd")
# plot just a subset of the table
assoc(head(dt, 5), shade = TRUE, las=3)

chisq.test(data,simulate.p.value = T)
fisher.test(data,simulate.p.value=TRUE)
#friedman.test(as.matrix(data))
library(DescTools)
GTest(data)

map_operator = data

library(corrplot)
plot.new()
corrplot(chisq$residuals, is.cor = FALSE)
dev.off()







###------------
data =0
for(i in 1:20){
  a = read.csv(paste('res/map_weapon',i-1,'.csv',sep = ''))
  rownames(a) = a$X
  a$X = NULL
  data = data + a
}
data = data/20
chisq.test(data)
fisher.test(data,simulate.p.value=TRUE)
GTest(data)
#friedman.test(as.matrix(data))

map_weapon = data

###--------------
data = 0
for(i in 1:20){
  a = read.csv(paste('res/role_map',i-1,'.csv',sep = ''))
  rownames(a) = a$X
  a$X = NULL
  data = data + a
}
data = data/20
chisq.test(data)
fisher.test(data,simulate.p.value=TRUE)
GTest(data)
#friedman.test(as.matrix(data))

role_map = data

###---------------
data = 0
for(i in 1:20){
  a = read.csv(paste('res/role_mode',i-1,'.csv',sep = ''))
  rownames(a) = a$X
  a$X = NULL
  data = data + a
}
data = data/20
chisq.test(data)
fisher.test(data,simulate.p.value=TRUE)
GTest(data)
#friedman.test(as.matrix(data))

role_mode = data


#####################
data = 0
for(i in 1:20){
  a = read.csv(paste('res/logistic',i-1,'.csv',sep = ''))
  data=cbind(data,a$coef)
}

data=data.frame(feature=a$feature,coef=rowMeans(data,na.rm = T))
data[order(-abs(data$coef)),]

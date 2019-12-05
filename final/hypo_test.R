data = 0
for(i in 1:15){
  a = read.csv(paste('res/map_operator',i-1,'.csv',sep = ''))
  rownames(a) = a$X
  a$X = NULL
  data = data + a
}
data = data/15
chisq.test(data)
friedman.test(as.matrix(data))

map_operator = data

###------------
data = 0
for(i in 1:15){
  a = read.csv(paste('res/map_weapon',i-1,'.csv',sep = ''))
  rownames(a) = a$X
  a$X = NULL
  data = data + a
}
data = data/15
chisq.test(data)
friedman.test(as.matrix(data))

map_weapon = data

###--------------
data = 0
for(i in 1:15){
  a = read.csv(paste('res/role_map',i-1,'.csv',sep = ''))
  rownames(a) = a$X
  a$X = NULL
  data = data + a
}
data = data/15
chisq.test(data)
friedman.test(as.matrix(data))

role_map = data

###---------------
data = 0
for(i in 1:15){
  a = read.csv(paste('res/role_mode',i-1,'.csv',sep = ''))
  rownames(a) = a$X
  a$X = NULL
  data = data + a
}
data = data/15
chisq.test(data)
friedman.test(as.matrix(data))

role_mode = data
